//
//  GameBoardFrame.swift
//  blind
//
//  Created by 성시철 on 2018. 1. 9..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit

class GameBoardFrameView: UIScrollView {
    let gameBoard: GameBoardView!
    
    override init(frame: CGRect) {
        self.gameBoard = GameBoardView(frame: CGRect(origin: .zero, size: frame.size))
        super.init(frame: frame)
        
        self.contentSize = self.gameBoard.frame.size
        self.bounces = false
        self.bouncesZoom = false
        
        self.minimumZoomScale = 1
        self.maximumZoomScale = 5
        
        self.addSubview(self.gameBoard)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:SiCheol Sung) has not been implemented")
    }
    
    
    //what is touchesShouldCancel
    override func touchesShouldCancel(in view: UIView) -> Bool {
        if view is UIButton { return true }
        return super.touchesShouldCancel(in: view)
    }
    

}

