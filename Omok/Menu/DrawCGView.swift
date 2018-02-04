//
//  DrawCGView.swift
//  Omok
//
//  Created by 정기웅 on 2018. 2. 4..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit

@IBDesignable class DrawCGView: UIView {
    let buttonLength: CGFloat = MainViewController.BUTTON_LENGTH
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    static var isListView = false
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: (width + buttonLength) / 2,
                              y: height / 2))
        path.addLine(to: CGPoint(x: width,
                                 y: height / 2))
        

        if DrawCGView.isListView {
            path.move(to: CGPoint(x: 0,
                                  y: height / 2))
            path.addLine(to: CGPoint(x: (width - buttonLength) / 2,
                                     y: height / 2))
        }
        DrawCGView.isListView = true
        
        path.lineWidth = 5
        UIColor.white.setStroke()
        path.stroke()
        
        
        
    }
    
}
