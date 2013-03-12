#include <iostream>
#include <unordered_map>
#include <cmath>

class Solver {
    std::unordered_map<int, bool> prime_;

    bool isPrime(int x)
    {
        int k, bound;
        if (prime_.count(x))
            return prime_[x];

        if (!(x % 2) || !(x % 3))
            return false;

        k = 1;
        bound = sqrt(x);
        while (1) {
            int m = 6 * k - 1, n = 6 * k + 1;
            if (m > bound)
                break;
            if (!(x % m) || !(x % n))
                return prime_[x] = false;
            ++k;
        }

        return prime_[x] = true;
    }

    bool isTruncPrime(int x)
    {
        int t = x, n = 1;

        do {
            if (!isPrime(t))
                return false;
        } while (t /= 10);

        t = x;
        while (t % (n *= 10) != t) {
            if (!isPrime(t % n))
                return false;
        }
        return true;
    }

public:
    Solver()
    {
        prime_[1] = false;
        prime_[2] = true;
        prime_[3] = true;
    }

    int truncPrimes(int solve)
    {
        int x = 10, c = 0, s = 0;
        while (c < solve) {
            if (isTruncPrime(++x)) {
                s += x;
                ++c;
            }
        }
        return s;
    }
};

int main(int argc, const char* argv[])
{
    Solver s;
    std::cout << s.truncPrimes(11) << std::endl;
}
