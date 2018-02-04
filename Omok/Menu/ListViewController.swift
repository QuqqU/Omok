//
//  ListViewController.swift
//  blind
//
//  Created by 정기웅 on 2018. 2. 2..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit


class ListViewController: UIViewController {
   
    
    @IBOutlet weak var gameStartButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setButton()
        
 
    }
    

    func setButton() {
        let buttonLength: CGFloat = MainViewController.BUTTON_LENGTH
        
        self.gameStartButton.frame = CGRect(x: (UIScreen.main.bounds.width - buttonLength) / 2,
                                            y: (UIScreen.main.bounds.height - buttonLength) / 2,
                                            width: buttonLength,
                                            height: buttonLength)
        
        
    }
    
    
}
