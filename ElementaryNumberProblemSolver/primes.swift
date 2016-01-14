//
//  primefactorization.swift
//  ElementaryNumberTools
//
//  Created by Stephen  on 2015-12-21.
//  Copyright © 2015 StephenXie. All rights reserved.
//

import Foundation

// isPrime returns true if i is prime, false otherwise
// i must be greater than 1
internal func isPrime(let i:Int) -> Bool {
    var counter = 2
    while counter != i {
        if i % counter == 0 {
            return false
        } else {
            ++counter
        }
    }
    return true
}


// primeFactorization returns the Prime Factorization of x
// x must be greater than 1
internal func primeFactorization(var x:Int) -> String {
    var bases = [Int]()
    while x != 1 {
        var counter = 2
        while counter <= x {
            // check if counter divides x
            if x % counter == 0 {
                // check if counter is prime
                if isPrime(counter) == true {
                    x = x / counter
                    bases.append(counter)
                    counter = 2
                    break
                // if not prime, check next int
                } else {
                    ++counter
                }
            // if counter does not divide x, check next int
            } else {
                ++counter
            }
        }
    }
    // create dict to hold bases as keys and exponents as values
    var expDict = [Int:Int]()
    for i in bases {
        if expDict[i] != nil {
            expDict[i] = expDict[i]! + 1
        } else {
            expDict[i] = 1
        }
    }
    // sort the dictionary by key
    let sortedDict = expDict.sort({ $0.0 < $1.0 })

    var answer = ""
    var length = 1
    for pair in sortedDict {
        if length <= sortedDict.count - 1 {
            if pair.1 != 1 {
                answer = answer + String(pair.0) + "^" + String(pair.1) + " x "
                ++length
            } else {
                answer = answer + String(pair.0) + " x "
                ++length
            }
        } else {
            if pair.1 != 1 {
                answer = answer + String(pair.0) + "^" + String(pair.1)
                ++length
            } else {
                answer = answer + String(pair.0)
                ++length
            }
            
        }
    }
    return answer
}

// positiveDivisors creates an Int array of the positive divisors of x
internal func positiveDivisors(let x:Int) -> Array<Int> {
    var intArray = [Int]()
    for i in 1...x {
        if x % i == 0 {
            intArray.append(i)
        }
    }
    return intArray
}


