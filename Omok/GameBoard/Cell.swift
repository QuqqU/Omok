//
//  buttonCell.swift
//  blind
//
//  Created by 정기웅 on 2018. 1. 6..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit

class Cell: UIButton {
    var cellState: State
    
    private let isCirclePoint: Bool
    let x:Int
    let y:Int
    
    init(frame: CGRect, isCirclePoint: Bool, x: Int ,y:Int) {
        cellState = .uncreated
        self.isCirclePoint = isCirclePoint
        self.x = x
        self.y = y
        super.init(frame: frame)
        self.setBackgroundImage(UIImage(named: "uncreated.png"), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: SiCheol Sung) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        switch self.cellState {
        case .empty:
            //if there is previous placeholder in board, delete it.
            for cells in Manager.manager.board {
                for cell in cells {
                    if cell.cellState == .placeholding {
                        cell.changeCellState(.empty)
                    }
                }
            }
            //placeholding in selected position.
            self.changeCellState(.placeholding)
        case .placeholding:
            self.changeCellState(Manager.manager.turn == .p0 ? .p0 : .p1)
            if Manager.manager.isGameFinished() {
                
                guard let rootViewController: UIViewController = UIApplication.shared.windows[0].rootViewController else {
                    return
                }
                
                //////////////////////////////////
                //////////////////////////////////
                //객체화 필수
                
                let alert = UIAlertController(title: "기모띠", message: "기모리", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                
                for cells in Manager.manager.board {
                    for cell in cells {
                        cell.cellState = .empty
                        cell.setBackgroundImage(UIImage(named: "empty.png"), for: .normal)
                    }
                }
                
                rootViewController.present(alert, animated: true, completion: nil)
                
                
                ///////////////////////////////////
                ///////////////////////////////////
            }
            Manager.manager.turnOver()
            Manager.manager.updateField()
        default: ()
        }
    }
    
    func changeCellState(_ state: State) {
        self.cellState = state
        switch state {
        case .empty:
            changeImage(named: self.isCirclePoint ? "empty_pt.png" : "empty.png")
        case .p0:
            changeImage(named: "placed.png")
        case .p1:
            changeImage(named: "revealed.png")
        case .placeholding:
            changeImage(named: self.isCirclePoint ? "placeholder_pt.png" : "placeholder.png")
        case .uncreated: break
        case .border:
            changeImage(named: "borderTop.png")
        }
    }
    
    func changeImage(named: String) {
        self.setBackgroundImage(UIImage(named: named), for: .normal)
    }
    

}

