def containsOrigin(x1, y1, x2, y2, x3, y3):
    det = float((y2 - y3) * (x1 - x3) + (x3 - x2) * (y1 - y3))
    lambda1 = ((y2 - y3) * (-x3) + (x3 - x2) * (-y3)) / det
    if lambda1 <= 0.0 or lambda1 >= 1.0:
        return False
    lambda2 = ((y3 - y1) * (-x3) + (x1 - x3) * (-y3)) / det

    return lambda2 > 0.0 and lambda2 < 1.0
