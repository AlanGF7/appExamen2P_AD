//
//  ResultsViewController.swift
//  appExamen2P_AD
//
//  Created by Alan Guzmán Flores on 15/05/22.
//

import UIKit

class ResultsViewController: UIViewController {

    
    //MARK: Variables
    @IBOutlet weak var HangPlayer1: UILabel!
    @IBOutlet weak var HangPlayer2: UILabel!
    @IBOutlet weak var QAPlayer1: UILabel!
    @IBOutlet weak var QAPlayer2: UILabel!
    @IBOutlet weak var TicTacToePlayer1: UILabel!
    @IBOutlet weak var TicTacToePlayer2: UILabel!
    @IBOutlet weak var WinnerLabel: UILabel!
    
    //MARK: OnInit()
    override func viewDidLoad() {
        super.viewDidLoad()
        printBoard()
        calculateWinner()
    }

    //MARK: Functions
    func printBoard()
    {
        HangPlayer1.text = String(Player1HM)
        HangPlayer2.text = String(Player2HM)
        
        QAPlayer1.text = String(Player1QA)
        QAPlayer2.text = String(Player2QA)
        
        TicTacToePlayer1.text = String(Player1TTT)
        TicTacToePlayer2.text =  String(Player2TTT)
    }
    
    func calculateWinner()
    {
        var WinnerP1 = 0
        var WinnerP2 = 0
        WinnerP1 += (Player1HM + Player1QA + Player1TTT)
        WinnerP2 += (Player2HM + Player2QA + Player2TTT)
        
        if(WinnerP1 > WinnerP2) { WinnerLabel.text = "Ganador: Jugador 1"}
        else { WinnerLabel.text = "Ganador: Jugador 2"}
        
        if(WinnerP1 == WinnerP2) { WinnerLabel.text = "¡Empate!"}
    }
    
    func restartBoard(){
        Player1QA = 0
        Player1HM = 0
        Player1TTT = 0
        
        Player2QA = 0
        Player2HM = 0
        Player2TTT = 0
        
        HangPlayer1.text = "0"
        HangPlayer2.text = "0"
        
        QAPlayer1.text = "0"
        QAPlayer2.text = "0"
        
        TicTacToePlayer1.text = "0"
        TicTacToePlayer2.text = "0"
        
        WinnerLabel.text = "¡Suerte!"
    }
    
    //MARK: Actions
    @IBAction func onClickRestart(_ sender: Any) {
        restartBoard()
    }
}
