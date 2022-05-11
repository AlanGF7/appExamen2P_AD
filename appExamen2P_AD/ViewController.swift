//
//  ViewController.swift
//  appExamen2P_AD
//
//  Created by ISSC_612_2022 on 29/04/22.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

