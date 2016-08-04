//
//  Algorithm.swift
//  ACFianlAssessment
//
//  Created by Leo on 8/4/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit

class Algorithm: NSObject {
    //MARK sum odd numbers up
    func sumOdd(n:Int) -> Int {
        
        var sum = 0
        for i in 0...n {
        while i % 2 == 1 {
            sum += i
         }
        }
        return sum
    }
}
