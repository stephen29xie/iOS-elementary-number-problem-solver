//
//  lde.swift
//  ElementaryNumberTools
//
//  Created by Stephen  on 2015-12-14.
//  Copyright © 2015 StephenXie. All rights reserved.
//

import Foundation

// extendedGcd(a,b) returns the solution x and y, where ax + by = gcd(a,b)
internal func extendedGcd(var a: Int, var b: Int) -> (Int, Int)
{
    var x = 1
    var y = 0
    var x0 = 0
    var y0 = 1
    var q: Int, r: Int , m: Int, n: Int
    while a != 0 {
        q = b/a
        r = b%a
        m = x0 - q * x
        n = y0 - q * y
        x0 = x
        y0 = y
        x = m
        y = n
        b = a
        a = r
    }
    return (x0, y0)
}

// solveLde(a,b,c) solves a Linear Diophantene Equation (ax + by = c) outputting an
// informative string stating a particular solution and a complete solution
internal func solveLde(let a: Int, let b: Int, let c: Int) -> String {
    let gcd = calculateGcd(a, int2: b)
    // if gcd(a,b) does not divide c, no solutions
    if  ((Double(c)/Double(gcd)) % 1) != 0 {
        return "No Solutions"
    }
    var x = extendedGcd(a, b: b).0
    var y = extendedGcd(a, b: b).1
    let multiplier = c / gcd
    x = x * multiplier
    y = y * multiplier
    
    if a*x + b*y == c { x = abs(x) ; y = abs(y) }
    if a*(-x) + b*(-y) == c { x = x * -1 ; y = y * -1 }
    if a*(-x) + b*y == c { x = x * -1 ; y = abs(y) }
    if a*x + b*(-y) == c { x = abs(x) ; y = y * -1 }
    
    let bd = b/gcd // (b/gcd)*n, nεZ
    let ad = a/gcd // (a/gcd)*n, nεZ

    var completeX:String, completeY:String
    if bd >= 0 {
        completeX = "One particular solution is:\n x0 = " + String(x) + " and y0 = " + String(y) + "\n\nThe complete integer solution is:\n" + "x = " + String(x) + " + " + String(bd) + "n\n"
    } else {
        completeX = "One particular solution is:\n x0 = " + String(x) + " and y0 = " + String(y) + "\n\nThe complete integer solution is:\n" + "x = " + String(x) + " - " + String(abs(bd)) + "n\n"
    }
    if ad >= 0 {
        completeY = "y = " + String(y) + " - " + String(ad) + "n"
    } else {
        completeY = "y = " + String(y) + " + " + String(abs(ad)) + "n\n"
    }
    
    return(completeX + completeY)
    
    
}
