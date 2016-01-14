//
//  modulo.swift
//  ElementaryNumberTools
//
//  Created by Stephen  on 2015-12-21.
//  Copyright © 2015 StephenXie. All rights reserved.
//

import Foundation

// a is an integer, m is a positive integer
internal func modulo(var b:Int, let m:Int) -> Int {
    if b >= 0 {
        return b % m
    } else {
        while b < 0 {
            b = b + m
        }
        return b
    }
}
