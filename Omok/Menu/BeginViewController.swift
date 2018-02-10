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
        setButton()
    }
    
    func setButton() {
        let buttonLength: CGFloat = MainViewController.START_BUTTON_LENGTH
        self.startButton.frame = CGRect(x: (UIScreen.main.bounds.width - buttonLength) / 2,
                                        y: (UIScreen.main.bounds.height - buttonLength) / 2,
                                        width: buttonLength,
                                        height: buttonLength)
    }
    
    @IBAction func start(_ sender: UIButton) {
        print("Start button touched")
        if self.delegate?.isBeginViewShowing == true {
            self.delegate?.openListView(nil)
        }
    }

}
