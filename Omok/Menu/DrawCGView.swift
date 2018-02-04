//
//  DrawCGView.swift
//  Omok
//
//  Created by 정기웅 on 2018. 2. 4..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit

class DrawCGView: UIView {
    let buttonLength: CGFloat = MainViewController.BUTTON_LENGTH
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: (width + buttonLength) / 2,
                              y: height / 2))
        path.addLine(to: CGPoint(x: width,
                                 y: height / 2))
        path.lineWidth = 5
        UIColor.white.setStroke()
        path.stroke()
    }
    
}
