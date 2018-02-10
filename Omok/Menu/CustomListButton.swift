//
//  CustomListButton.swift
//  Omok
//
//  Created by 정기웅 on 2018. 2. 10..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit

class CustomListButton: UIButton {
    
    let LENGTH: CGFloat = MainViewController.LIST_BUTTON_LENGTH
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 5, y: 0))
        
        path.addLine(to: CGPoint(x: LENGTH - 5, y: 0))
        path.addQuadCurve(to: CGPoint(x: LENGTH, y: 5),
                          controlPoint: CGPoint(x: LENGTH, y: 0))
        
        path.addLine(to: CGPoint(x: LENGTH, y: LENGTH - 5))
        path.addQuadCurve(to: CGPoint(x: LENGTH - 5, y: LENGTH),
                          controlPoint: CGPoint(x: LENGTH, y: LENGTH))
        
        path.addLine(to: CGPoint(x: 5, y: LENGTH))
        path.addQuadCurve(to: CGPoint(x: 0, y: LENGTH - 5),
                          controlPoint: CGPoint(x: 0, y: LENGTH))
        
        path.addLine(to: CGPoint(x: 0, y: 5))
        path.addQuadCurve(to: CGPoint(x: 5, y: 0),
                          controlPoint: CGPoint(x: 0, y: 0))
        
        path.lineWidth = 7
        UIColor.white.setStroke()
        path.stroke()
    }

}
