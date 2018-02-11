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
    var historyFlag:Int = 0
    var isPlaying: Bool = true
    
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
    
    func initField() {
        makeRow : for y in 0..<19 {
            makeColumn : for x in 0..<19 {
                Manager.manager.board[y][x].changeCellState(.uncreated)
            }
        }
        self.historyFlag = 0
        self.history.removeAll()
        self.turn = .p0
        self.isPlaying = true
        
        self.rootViewController?.reviewAfter.isEnabled = false
        self.rootViewController?.reviewBefore.isEnabled = false
        self.rootViewController?.reviewAfter.isHidden = true
        self.rootViewController?.reviewBefore.isHidden = true
        
        self.rootViewController?.gameBoardFrameView.zoomScale = 1
        
        Manager.manager.board[9][9].changeCellState(.empty)
        Manager.manager.updateField()
    }
    
    func checkFinished() {
        if self.checkHorizontal() || self.checkVertical() || self.checkDiagonal() {
            self.clearField()
            self.isPlaying = false
            var i:Double = 0
            let len:Double = Double(Manager.manager.board.count)
            self.turn = .p0
            
            for pos in self.history {
                let turn = self.turn
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .microseconds(Int(i/len*2500000))) {
                    let pos = pos
                    self.board[pos.y][pos.x].changeCellState(turn)
                    self.board[pos.y][pos.x].changeImage(named: turn == .p0 ? "placed.png" : "revealed.png")
                    self.board[pos.y][pos.x].didChangeValue(forKey: "backgoundImage")
                }
                self.turn.turnOver()
                i += 1
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .microseconds(Int((i)/len*2500000))) {
                self.rootViewController?.reviewAfter.isEnabled = true
                self.rootViewController?.reviewBefore.isEnabled = true
                self.rootViewController?.reviewAfter.isHidden = false
                self.rootViewController?.reviewBefore.isHidden = false
                self.historyFlag = self.history.count
            }
        }
    }
    
    func reviewBefore() {
        if 0..<self.history.count ~= self.historyFlag-1 {
            self.historyFlag -= 1
            let pos = self.history[self.historyFlag]
            self.board[pos.y][pos.x].changeCellState(.empty)
            self.turn.turnOver()
        }
    }
    
    func reviewAfter() {
        if 0..<self.history.count ~= self.historyFlag {
            let pos = self.history[self.historyFlag]
            self.historyFlag += 1
            self.turn.turnOver()
            self.board[pos.y][pos.x].changeCellState(self.turn)
            self.board[pos.y][pos.x].changeImage(named: self.turn == .p0 ? "placed.png" : "revealed.png")
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
