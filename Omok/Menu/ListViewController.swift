//
//  ListViewController.swift
//  blind
//
//  Created by 정기웅 on 2018. 2. 2..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit


class ListViewController: UIViewController {
   
    let buttonLength: CGFloat = MainViewController.LIST_BUTTON_LENGTH
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var delegate: MainViewController?
    
    
    @IBOutlet weak var gameStartButton: CustomListButton!
    @IBOutlet weak var gameAIButton: CustomListButton!
    @IBOutlet weak var emptyLeft: CustomListButton!
    @IBOutlet weak var emptyRight: CustomListButton!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setButton()
    }
    
    func setButton() {
        self.gameStartButton.frame = CGRect(x: width / 2 + 15,
                                            y: height / 2 - buttonLength - 15,
                                            width: buttonLength,
                                            height: buttonLength)
        
        self.emptyLeft.frame = CGRect(x: width / 2 - buttonLength - 15,
                                            y: height / 2 - buttonLength - 15,
                                            width: buttonLength,
                                            height: buttonLength)
        
        self.gameAIButton.frame = CGRect(x: width / 2 - buttonLength - 15,
                                      y: height / 2 + 15,
                                      width: buttonLength,
                                      height: buttonLength)
        
        self.emptyRight.frame = CGRect(x: width / 2 + 15,
                                         y: height / 2 + 15,
                                         width: buttonLength,
                                         height: buttonLength)
    }
    
    

    @IBAction func gameStart(_ sender: Any) {
        print("1:1 button touched")
        self.delegate?.openGameView(nil)
    }
    
    
}
