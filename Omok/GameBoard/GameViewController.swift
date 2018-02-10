//
//  ViewController.swift
//  blind
//
//  Created by 정기웅 on 2018. 1. 6..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    
    
    @IBOutlet weak var backButton: UIButton!
    
    var gameBoardFrameView: GameBoardFrameView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //forbid swipe to previous view
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.navigationBar.isHidden = true
        
        let height = Manager.manager.height
        let width = Manager.manager.width
     
        
        self.gameBoardFrameView = GameBoardFrameView(frame: CGRect(x: 0.0,
                                                                   y: 100,
                                                                   width: width,
                                                                   height: height-150))
        print("Game Board View is built");
        
        self.gameBoardFrameView.delegate = self
        self.view.addSubview(self.gameBoardFrameView!)
    }
    
    @IBAction func goBack(_ sender: Any) {
    }
    
}

extension GameViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.gameBoardFrameView.gameBoard
    }
}

