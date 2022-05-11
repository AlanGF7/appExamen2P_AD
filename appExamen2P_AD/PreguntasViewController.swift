//
//  PreguntasViewController.swift
//  appExamen2P_AD
//
//  Created by Alan Guzmán Flores on 03/05/22.
//

import UIKit

class PreguntasViewController: UIViewController {

    
    
    @IBOutlet weak var PreguntaText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PreguntaText.text = quiz[Int.random(in: 0...2)][0]
    }
    
    let quiz = [["¿El cielo es azul?","True"], ["¿Swift es de Apple?","True"],["¿Uriel y Alex son gemelos?","True"]]
    
    @IBAction func onClickJugar(_ sender: UIButton) {
        print(sender.currentTitle ?? "")
    }
    

}
