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
    
    @IBOutlet weak var startButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        startButton.setBackgroundImage(UIImage(named: "start.png"), for: .normal)
    }
    
    
    
    
    @IBAction func start(_ sender: UIButton) {
        print("Start button touched")
        if self.delegate?.isBeginViewShowing == true {
            self.delegate?.openListView(nil)
        }
    
    }

}
