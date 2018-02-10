//
//  InfoViewController.swift
//  Omok
//
//  Created by 정기웅 on 2018. 2. 10..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    @IBOutlet weak var infoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let viewWidth = infoView.bounds.width
        let viewHeight = infoView.bounds.height
        
        self.infoView.frame.origin = CGPoint(x: (width - viewWidth) / 2,
                                             y: (height - viewHeight) / 2)
    }
    
}
