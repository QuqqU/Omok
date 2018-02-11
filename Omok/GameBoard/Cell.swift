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
    let pos:Pos
    
    init(frame: CGRect, isCirclePoint: Bool, x: Int ,y:Int) {
        cellState = .uncreated
        self.isCirclePoint = isCirclePoint
        self.pos = (x:x, y:y)
        super.init(frame: frame)
        self.setBackgroundImage(UIImage(named: "uncreated.png"), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: SiCheol Sung) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (Manager.manager.isPlaying) {
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
                Manager.manager.history.append(pos)
                Manager.manager.updateField()
                Manager.manager.checkFinished()
                Manager.manager.turnOver()
            default: ()
            }
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
            changeImage(named: "placed.png")
        case .placeholding:
            changeImage(named: self.isCirclePoint ? "placeholder_pt.png" : "placeholder.png")
        case .uncreated:
            changeImage(named: "uncreated.png")
        }
    }
    
    func changeImage(named: String) {
        self.setBackgroundImage(UIImage(named: named), for: .normal)
    }
    

}

