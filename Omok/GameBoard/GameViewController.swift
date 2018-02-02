//
//  ViewController.swift
//  blind
//
//  Created by 정기웅 on 2018. 1. 6..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var gameBoardFrameView: GameBoardFrameView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let height = Manager.manager.height
        let width = Manager.manager.width
     
        
        self.gameBoardFrameView = GameBoardFrameView(frame: CGRect(x: 0.0,
                                                                   y: (height - width) / 2,
                                                                   width: width,
                                                                   height: width))
        print("Game Board View is built");
        
        self.gameBoardFrameView.delegate = self
        self.view.addSubview(self.gameBoardFrameView!)
    }
    

}

extension GameViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.gameBoardFrameView.gameBoard
    }
}
