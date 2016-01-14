//
//  congruence.swift
//  ElementaryNumberTools
//
//  Created by Stephen  on 2015-12-19.
//  Copyright © 2015 StephenXie. All rights reserved.
//

import Foundation

internal func linearCongruence(let a:Int, c:Int, m:Int) -> String {
    // there are gcd(a,m) number of solutions if gcd|c
    let gcd = calculateGcd(a, int2: m)
    // if gcd(a,b) does not divide c, no solutions
    if  ((Double(c)/Double(gcd)) % 1) != 0 {
        return "No Solutions"
    }
    var x = extendedGcd(a, b: m).0
    var y = extendedGcd(a, b: m).1
    let multiplier = c / gcd
    x = x * multiplier
    y = y * multiplier
    
    if a*x + m*y == c { x = abs(x) ; y = abs(y) }
    if a*(-x) + m*(-y) == c { x = x * -1 ; y = y * -1 }
    if a*(-x) + m*y == c { x = x * -1 ; y = abs(y) }
    if a*x + m*(-y) == c { x = abs(x) ; y = y * -1 }
    
    x = modulo(x, m:m) // one solution
    var xarray = [Int]()
    xarray.append(x)
    if gcd > 1 {
        for index in 1...(gcd-1) {
            xarray.append(modulo(x + (index*(m/gcd)), m:m))
        }
    }
    var fullSolution = "The full solution is:\n x ≡ "
    let oneSolution = "One solution is:\n x0 = \(x) (mod \(m))\n\n"
    var count = 0
    for number in xarray {
        fullSolution = fullSolution + String(number)
        ++count
        if count < xarray.count {
            fullSolution = fullSolution + ", "
        }
    }
    fullSolution = fullSolution + " (mod \(m))"
    return (oneSolution + fullSolution)
}
