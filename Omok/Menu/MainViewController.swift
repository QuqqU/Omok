//
//  MainViewController.swift
//  blind
//
//  Created by 정기웅 on 2018. 2. 2..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {
    
    static let START_BUTTON_LENGTH: CGFloat = 200
    static let LIST_BUTTON_LENGTH: CGFloat = 140
    
    let SLIDE_TIME = 0.5
    let LISTVIEW_WIDTH: CGFloat = UIScreen.main.bounds.width
    
    var listVC: UIViewController?
    var beginVC: UIViewController?
    var gameVC: UIViewController?
    var isBeginViewShowing = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.setupBeginView()
    }
    
    func setupBeginView() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "begin_navi") as? UINavigationController {
            self.beginVC = vc
            self.beginVC?.view.alpha = 0
            self.addChildViewController(vc)
            self.view.addSubview(vc.view)
            vc.didMove(toParentViewController: self)
            
            let _beginVC = vc.viewControllers[0] as? BeginViewController
            _beginVC?.delegate = self
            
            UIView.animate(withDuration: TimeInterval(self.SLIDE_TIME),
                           animations: { self.beginVC?.view.alpha = 1 },
                           completion: nil)
            
        }
    }
    
    
    
    
    
    func getListView() {
        if self.listVC != nil { return }
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "list_navi") as? UINavigationController {
            self.listVC = vc
            self.listVC?.view.alpha = 0
            self.addChildViewController(vc)
            self.view.addSubview(vc.view)
            vc.didMove(toParentViewController: self)
            self.view.bringSubview(toFront: (self.beginVC?.view)!)
            
            let _listVC = vc.viewControllers[0] as? ListViewController
            _listVC?.delegate = self
        }
    }
    
    func openListView(_ complete: ( () -> Void )?) {
        print("Turn to List View")
        self.getListView()
        
        UIView.animate(withDuration: TimeInterval(self.SLIDE_TIME),
                       animations: { self.beginVC?.view.alpha = 0 },
                       completion: { (finished: Bool) -> Void in
                        UIView.animate(withDuration: TimeInterval(self.SLIDE_TIME),
                                       animations: { self.listVC?.view.alpha = 1 },
                                       completion: nil)
        })
    }
    
    
    
    
    
    func getGameView() {
        if self.gameVC != nil { return }
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "game_navi") as? UINavigationController {
            self.gameVC = vc
            self.gameVC?.view.alpha = 0
            self.addChildViewController(vc)
            self.view.addSubview(vc.view)
            vc.didMove(toParentViewController: self)
            self.view.bringSubview(toFront: (self.listVC?.view)!)
            
            let _gameVC = vc.viewControllers[0] as? GameViewController
            _gameVC?.delegate = self
        }
    }
    
    
    func openGameView(_ complete: ( () -> Void )?) {
        print("Turn to Game View")
        self.getGameView()
        
        UIView.animate(withDuration: TimeInterval(self.SLIDE_TIME),
                       animations: { self.listVC?.view.alpha = 0 },
                       completion: { (finished: Bool) -> Void in
                        UIView.animate(withDuration: TimeInterval(self.SLIDE_TIME),
                                       animations: { self.gameVC?.view.alpha = 1 },
                                       completion: nil)
        })
    }
    
    
    
    
    
    func backToList() {
        print("Back to List View")
        getListView()
        
        UIView.animate(withDuration: TimeInterval(self.SLIDE_TIME),
                       animations: { self.gameVC?.view.alpha = 0 },
                       completion: { (finished: Bool) -> Void in
                        UIView.animate(withDuration: TimeInterval(self.SLIDE_TIME),
                                       animations: { self.listVC?.view.alpha = 1 },
                                       completion: { (_) in Manager.manager.initField() })
        })
    }
}




















