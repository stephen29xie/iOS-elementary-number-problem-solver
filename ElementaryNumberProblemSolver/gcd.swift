//
//  gcd.swift
//  ElementaryNumberTools
//
//  Created by Stephen  on 2015-12-12.
//  Copyright © 2015 StephenXie. All rights reserved.
//

import Foundation

// calculateGcd produces the greatest common divisor of int1 and int2
internal func calculateGcd(var int1: Int, var int2: Int) -> Int
{
    if int1 < 0 {
        int1 = int1 * (-1)
    }
    if int2 < 0 {
        int2 = int2 * (-1)
    }
    if (int1 == int2) {
        return int1;
    }
    if (int1 == 0) {
        return int2;
    }
    if (int2 == 0) {
        return int1;
    }
    var a = 1, b = 1, q = 1, r = 1
    if (int1 > int2) {
        a = int1
        b = int2
    }
    if (int2 > int1) {
        a = int2
        b = int1
    }
    while true {
        while b * (q+1) <= a {
            ++q
        }
        r = a - (b * q)
        if r == 0 { break }
        a = b
        b = r
        q = 1
        continue
    }
    return b
}