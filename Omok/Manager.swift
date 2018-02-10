//
//  Manager.swift
//  blindOmok
//
//  Created by 정기웅 on 2018. 1. 9..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit


class Manager {
    static let manager = Manager()
    
    var board: Array<[Cell]>
    let numOfRows: Int
    var turn: State
    let width: CGFloat
    let height: CGFloat
    var rootViewController: GameViewController?
    var history:Array<Pos>
    
    init(){
        board = [[Cell]]()
        numOfRows = 19
        turn = .p0
        width = UIScreen.main.bounds.width
        height = UIScreen.main.bounds.height
        history = []
    }

    func turnOver() {
        self.turn.turnOver()
    }
    
    func updateField() {
        var tempBoard = self.board.map{$0.map{$0.cellState}}
        toEmptyState : for y in 0..<19 {
            for x in 0..<19 {
                let cell = tempBoard[y][x]
                if cell == .uncreated {
                    for dy in -1..<2 {
                        for dx in -1..<2 {
                            if 0..<19 ~= y+dy && 0..<19 ~= x+dx {
                                let neighbor = tempBoard[y+dy][x+dx]
                                if neighbor == .p0 || neighbor == .p1 {
                                    self.board[y][x].changeCellState(.empty)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func clearField() {
        for x in 0..<19 {
            for y in 0..<19 {
                if self.board[y][x].cellState != .uncreated { self.board[y][x].changeCellState(.empty) }
            }
        }
    }
    
    func checkFinished() {
        if self.checkHorizontal() || self.checkVertical() || self.checkDiagonal() {
            Manager.manager.clearField()
            var player = 1
            var i:Double = 0
            let len:Double = Double(Manager.manager.board.count)
            
            for pos in Manager.manager.history {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .microseconds(Int(i/len*1000000))) {
                    let pos = pos
                    Manager.manager.board[pos.y][pos.x].changeCellState(player == 1 ? .p0 : .p1)
                    Manager.manager.board[pos.y][pos.x].changeImage(named: player == 1 ? "placed.png" : "revealed.png")
                    Manager.manager.board[pos.y][pos.x].didChangeValue(forKey: "backgoundImage")
                    player *= -1
                }
                i += 1
            }
        }
    }
}

extension Manager {
    private func checkHorizontal() -> Bool {
        horizontalLine : for x in 0..<board.count {
            departurePoint : for y in 0...board.count-5 {
                check5Stones : for dy in 0..<5 {
                    if board[x][y + dy].cellState != turn { continue departurePoint }
                }
                if (y + 5 == 19 || board[x][y + 5].cellState != turn) &&
                    (y == 0 || board[x][y - 1].cellState != turn) {
                    return true
                }
            }
        }
        return false
    }
    
    private func checkVertical() -> Bool {
        verticalLine : for y in 0..<board.count {
            departurePoint : for x in 0...board.count-5 {
                check5Stones : for dx in 0..<5 {
                    if board[x + dx][y].cellState != turn { continue departurePoint }
                }
                if (x + 5 == 19 || board[x + 5][y].cellState != turn) &&
                    (x == 0 || board[x - 1][y].cellState != turn) {
                    return true
                }
            }
        }
        return false
    }
    
    private func checkDiagonal() -> Bool {
        
        
        
        
        return false;
    }
}
