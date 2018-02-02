//
//  BeginViewController.swift
//  blind
//
//  Created by 정기웅 on 2018. 2. 2..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit


class BeginViewController: UIViewController {
    
    
    var delegate: MainViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func start(_ sender: UIButton) {
        print("Start button touched")
        if self.delegate?.isBeginViewShowing == true {
            self.delegate?.openListView(nil)
        }
    
    }

}
