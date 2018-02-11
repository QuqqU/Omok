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
    @IBOutlet weak var reviewAfter: UIButton!
    @IBOutlet weak var reviewBefore: UIButton!
    
    var gameBoardFrameView: GameBoardFrameView!
    var delegate: MainViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //forbid swipe to previous view
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.navigationBar.isHidden = true
        
        self.reviewAfter.isEnabled = false
        self.reviewBefore.isEnabled = false
        self.reviewAfter.isHidden = true
        self.reviewBefore.isHidden = true
        
        let height = Manager.manager.height
        let width = Manager.manager.width
     
        
        self.gameBoardFrameView = GameBoardFrameView(frame: CGRect(x: 0.0,
                                                                   y: 100,
                                                                   width: width,
                                                                   height: height-150))
        print("Game Board View is built");
        
        self.gameBoardFrameView.delegate = self
        Manager.manager.rootViewController = self
        self.view.addSubview(self.gameBoardFrameView!)
        self.reviewBefore.frame = CGRect(x:0, y:height-50, width:width/2, height:50)
        self.reviewAfter.frame = CGRect(x:width/2, y:height-50, width:width/2, height:50)
    }
    
  
    @IBAction func goBack(_ sender: Any) {
        print("Going to ListView Button touched")
        self.delegate?.backToList()
    }
    @IBAction func reviewAfter(_ sender: Any) {
        Manager.manager.reviewAfter()
    }
    @IBAction func reviewBefore(_ sender: Any) {
        Manager.manager.reviewBefore()
    }
}

extension GameViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.gameBoardFrameView.gameBoard
    }
}


