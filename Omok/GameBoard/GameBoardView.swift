//
//  GameBoardView.swift
//  blind
//
//  Created by 성시철 on 2018. 1. 9..
//  Copyright © 2018년 SiCheol Sung. All rights reserved.
//
import UIKit

class GameBoardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let num = Manager.manager.numOfRows
        makeRow : for y in 0..<num {
            Manager.manager.board.append([Cell]())
            makeColumn : for x in 0..<num {
                let width = frame.width
                let height = frame.height
                var isCirclePoint = false
                
                if [3, 9, 15].contains(x) && [3, 9, 15].contains(y) { isCirclePoint = true }
                let cell = Cell(frame: CGRect(x: width / CGFloat(num) * CGFloat(x),
                                              y: width / CGFloat(num) * CGFloat(y) + (height-width)/2,
                                              width: width / CGFloat(num),
                                              height: width / CGFloat(num)),
                                isCirclePoint: isCirclePoint, x: x, y: y)
                
                Manager.manager.board[y].append(cell)
                self.addSubview(cell)
            }
        }
        Manager.manager.board[9][9].changeCellState(.empty)
        Manager.manager.updateField()
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: SiCheol Sung) has not been implemented")
    }
}
