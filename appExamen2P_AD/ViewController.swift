//
//  ViewController.swift
//  appExamen2P_AD
//
//  Created by ISSC_612_2022 on 29/04/22.
//

import UIKit

var Player1HM = 0
var Player2HM = 0

var Player1TTT = 0
var Player2TTT = 0

var Player1QA = 0
var Player2QA = 0

var TotalPlayer1 = 0
var TotalPlayer2 = 0


class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onClickLogin(_ sender: Any) {
        performSegue(withIdentifier: "toMainMenu", sender: nil)
    }
    
    @IBAction func onClickGame1(_ sender: Any) {
        performSegue(withIdentifier: "toHangmanGame", sender: nil)
    }
    
    @IBAction func onClickGame2(_ sender: Any) {
        performSegue(withIdentifier: "toQuestionGame", sender: nil)
    }
    
    @IBAction func onClickGame3(_ sender: Any) {
        performSegue(withIdentifier: "toTicTacToeGame", sender: nil)
    }
    
    @IBAction func onClickResults(_ sender: Any) {
        performSegue(withIdentifier: "toTotalController", sender: nil)
    }
    
    
    
}

