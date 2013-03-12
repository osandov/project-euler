Nothing = 0
HighCard = 1
OnePair = 2
TwoPairs = 3
ThreeOfAKind = 4
Straight = 5
Flush = 6
FullHouse = 7
FourOfAKind = 8
StraightFlush = 9
RoyalFlush = 10

wins = ['Nothing',
        'High Card',
        'One Pair',
        'Two Pairs',
        'Three of a Kind',
        'Straight',
        'Flush',
        'Full House',
        'Four of a Kind',
        'Straight Flush',
        'Royal Flush']

class Card:
    def __init__(self, s):
        n = s[0]
        if n == 'T':
            self.n = 10
        elif n == 'J':
            self.n = 11
        elif n == 'Q':
            self.n = 12
        elif n == 'K':
            self.n = 13
        elif n == 'A':
            self.n = 14
        else:
            self.n = int(n)
        self.suit = s[-1]

    def __repr__(self):
        n = self.n
        if n == 10:
            n = 'T'
        elif n == 11:
            n = 'J'
        elif n == 12:
            n = 'Q'
        elif n == 13:
            n = 'K'
        elif n == 14:
            n = 'A'
        return str(n) + self.suit

def checkFlush(cards):
    suit = cards[0].suit
    oak = 1 + sum([1 if c.suit == suit else 0 for c in cards[1:]])
    if oak != 5:
        return Nothing, 0
    if checkStraight(cards)[0]:
        if cards[0].n == 10:
            return RoyalFlush, cards[-1]
        else:
            return StraightFlush, cards[-1]
    return Flush, cards[-1]


def checkStraight(cards):
    for i in range(1, len(cards)):
        if cards[i].n - cards[i - 1].n != 1:
            return Nothing, 0
    return Straight, cards[-1]

def checkPairs(cards):
    l = []
    c = cards[0].n
    pairing = 0
    for card in cards[1:]:
        if card.n == c:
            pairing += 1
        elif pairing:
            l.append((pairing + 1, c))
            pairing = 0
        c = card.n
    if pairing:
        l.append((pairing + 1, c))
    l.sort(key=lambda x: x[0])
    if len(l):
        if l[0][0] == 4:
            return FourOfAKind, l[0][1]
        if l[0][0] == 2:
            if len(l) > 1:
                if l[1][0] == 3:
                    return FullHouse, l[1][1]
                elif l[1][0] == 2:
                    return TwoPairs, max(l[0][1], l[1][1])
            return OnePair, l[0][1]
        elif l[0][0] == 3:
            return ThreeOfAKind, l[0][1]
    return Nothing, 0

def checkHand(s):
    hand = []
    for i in range(5):
        hand.append(Card(s[i * 3:i * 3 + 2]))
    hand.sort(lambda x, y: cmp(x.n, y.n))
    flush = checkFlush(hand)
    straight = checkStraight(hand)
    pairs = checkPairs(hand)
    return max(flush, straight, pairs, key=lambda x: x[0]), hand

def winner(player1, player2):
    p1, h1 = checkHand(player1)
    p2, h2 = checkHand(player2)
    if p1[0] == p2[0]:
        if p1[0] == Nothing or p1[1] == p2[1]:
            for i in range(4, -1, -1):
                if h1[i].n > h2[i].n:
                    return 1
                elif h1[i].n < h2[i].n:
                    return 2
        elif p1[1] > p2[1]:
            return 1
        else:
            return 2
    elif p1[0] > p2[0]:
        return 1
    else:
        return 2

def solve(filename):
    c = 0
    for line in open(filename, 'r'):
        if winner(line[:14], line[15:29]) == 1:
            c += 1
    return c

if __name__ == '__main__':
    print(solve('poker.txt'))
