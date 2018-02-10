//
//  StartButton.swift
//  Omok
//
//  Created by 정기웅 on 2018. 2. 4..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit

@IBDesignable class CustomStartButton: UIButton {

    let LENGTH: CGFloat = MainViewController.START_BUTTON_LENGTH
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 5, y: LENGTH / 2 - 5))
        
        path.addLine(to: CGPoint(x: LENGTH / 2 - 5, y: 5))
        path.addQuadCurve(to: CGPoint(x: LENGTH / 2 + 5, y: 5),
                          controlPoint: CGPoint(x: LENGTH / 2, y: 0))
        
        path.addLine(to: CGPoint(x: LENGTH - 5, y: LENGTH / 2 - 5))
        path.addQuadCurve(to: CGPoint(x: LENGTH - 5, y: LENGTH / 2 + 5),
                          controlPoint: CGPoint(x: LENGTH, y: LENGTH / 2))
        
        path.addLine(to: CGPoint(x: LENGTH / 2 + 5, y: LENGTH - 5))
        path.addQuadCurve(to: CGPoint(x: LENGTH / 2 - 5, y: LENGTH - 5),
                          controlPoint: CGPoint(x: LENGTH / 2, y: LENGTH))

        path.addLine(to: CGPoint(x: 5, y: LENGTH / 2 + 5))
        path.addQuadCurve(to: CGPoint(x: 5, y: LENGTH / 2 - 5),
                          controlPoint: CGPoint(x: 0, y: LENGTH / 2))
        
        
        path.lineWidth = 5
        UIColor.white.setStroke()
        path.stroke()
    }

}
