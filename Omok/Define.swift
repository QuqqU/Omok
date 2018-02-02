//
//  define.swift
//  blind
//
//  Created by 정기웅 on 2018. 1. 6..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import Foundation



///State of cell!
enum State {
    case empty
    case p0
    case p1
    case placeholding
    case uncreated
    case border
    
    mutating func turnOver() {
        switch self {
        case .p0 :
            self = .p1
        case .p1 :
            self = .p0
        default : ()
        }
    }
}


