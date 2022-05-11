//
//  TicTacToeViewController.swift
//  appExamen2P_AD
//
//  Created by Alan Guzmán Flores on 03/05/22.
//

import UIKit

class TicTacToeViewController: UIViewController {

    enum Turn{
        case O
        case X
    }
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    
    var firstTurn = Turn.X
    var currentTurn = Turn.X
    var clicks = 0
    
    var O = "O"
    var X = "X"
    var board = [UIButton]()
    
    var player1Score = 0
    var player2Score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }
    
    func initBoard(){
        board.append(btn1)
        board.append(btn2)
        board.append(btn3)
        board.append(btn4)
        board.append(btn5)
        board.append(btn6)
        board.append(btn7)
        board.append(btn8)
        board.append(btn9)
    }
    
    @IBAction func A1(_ sender: Any) {
    }

    @IBAction func onClickBoard(_ sender: UIButton) {
        addToBoard(sender)
        clicks+=1
        
        if(checkWinner(X)) {
            player1Score += 1
            clicks = 0
            resultAlert(title: "Player 1 Wins")
        }
        if(checkWinner(O)) {
            player2Score += 1
            clicks = 0
            resultAlert(title: "Player 2 Wins")
        }
        
        if(fullBoard())
        {
            resultAlert(title: "DRAW")
        }
    }
    
    func checkWinner(_ s: String) -> Bool{
        
        // Horizontal
        if checkMarked(btn1, s) && checkMarked(btn2, s) && checkMarked(btn3, s)
        {
            return true
        }
        if checkMarked(btn4, s) && checkMarked(btn5, s) && checkMarked(btn6, s)
        {
            return true
        }
        if checkMarked(btn7, s) && checkMarked(btn8, s) && checkMarked(btn9, s)
        {
            return true
        }
        
        //Vertical
        if checkMarked(btn1, s) && checkMarked(btn4, s) && checkMarked(btn7, s)
        {
            return true
        }
        if checkMarked(btn2, s) && checkMarked(btn5, s) && checkMarked(btn8, s)
        {
            return true
        }
        if checkMarked(btn3, s) && checkMarked(btn6, s) && checkMarked(btn9, s)
        {
            return true
        }
        
        //Diagonal
        if checkMarked(btn1, s) && checkMarked(btn5, s) && checkMarked(btn9, s)
        {
            return true
        }
        if checkMarked(btn3, s) && checkMarked(btn5, s) && checkMarked(btn7, s)
        {
            return true
        }
        return false
    }
    
    func checkMarked(_ button: UIButton, _ content: String) -> Bool{
        return button.title(for: .normal) == content
    }
    
    func resultAlert(title: String)
    {
        let message = "\nPlayer 1: " + String(player1Score) + "\n\nPlayer 2: " + String(player2Score)
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in self.resetBoard()
        }))
        
        self.present(alert, animated: true)
            
    }
    
    func resetBoard(){
        for button in board
        {
            //Checar error
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        
        if(firstTurn == Turn.O)
        {
            firstTurn = Turn.X
            turnLabel.text = X
        }
        else if(firstTurn == Turn.X)
        {
            firstTurn = Turn.O
            turnLabel.text = O
        }
        
        currentTurn = firstTurn
    }
    
    func fullBoard() -> Bool
    {
        /*for button in board
        {
            if(button.title(for: .normal) == nil){
                return false
            }
        }*/
        if(clicks == 8)
        {
            clicks = 0
            return true
        }
        else { return false }
        
    }
    
    func  addToBoard(_ sender: UIButton)
    {
        if(sender.title(for: .normal) == nil)
        {
            if(currentTurn == Turn.O)
            {
                sender.setTitle(O, for: .normal)
                currentTurn = Turn.X
                turnLabel.text = X
            }
            else if(currentTurn == Turn.X)
            {
                sender.setTitle(X, for: .normal)
                currentTurn = Turn.O
                turnLabel.text = O
            }
            sender.isEnabled = false
        }
    }
    
}
