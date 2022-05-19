//
//  PreguntasViewController.swift
//  appExamen2P_AD
//
//  Created by Alan Guzmán Flores on 03/05/22.
//

import UIKit

//Otras variables
var jugador1:Int = 0
var jugador2:Int = 0
var turno:Int = 1

var VidasJ01 = 0
var VidasJ02 = 0
var basico = false
var inter = false
var difi = false

class PreguntasViewController: UIViewController {

    var anterior = 0
    
    //Basico: 5, Intermedio: 7, Dificil:10
    //btnBasico btnInter btnDificl
    
    @IBOutlet weak var pregunta: UITextView!
    
    @IBOutlet weak var True: UIButton!
    
    @IBOutlet weak var False: UIButton!
    
    @IBOutlet weak var Jugador1lbl: UILabel!
    @IBOutlet weak var scoreJ1Txt: UILabel!
    @IBOutlet weak var vidasJ1: UILabel!
    
    
    
    @IBOutlet weak var Jugador2lbl: UILabel!
    @IBOutlet weak var scoreJ2Txt: UILabel!
    @IBOutlet weak var vidasJ2: UILabel!
    
    @IBOutlet weak var btnBasico: UIButton!
    @IBOutlet weak var btnInter: UIButton!
    @IBOutlet weak var btnDificl: UIButton!
    
    
    //Nivel Básico: listado 5 preguntas
    let quiz = [
        ["¿El Río Lerma es el más largo de México?", "True"],
        ["¿Tabasco, Quintana Roo y Yucatán pertenecen a la region Sureste?","True"],
        ["¿La zona Arqueológica Paquimé està en Jalisco?","False"],
        ["México se encuentra en Sur América","False"],
        ["Guadalajara, Jalisco es la ciudad más grande","True"]]
    
    //Nivel Intermedio: listado 7 preguntas
    let quiz2 = [
        ["Tlaxcala es el estado más pequeño", "True"],
        ["Pueblo Olmeca crearon las cabezas Colosales","True"],
        ["El frijol fue el alimento principal de los pueblos mesoamericanos","False"],
        ["México solía llamarse la Nueva España","True"],
        ["5 de mayo se celebra el día de la bandera","False"],
        ["Día de Muertes es una festividad importante de México","True"],
        ["La T.V. de color fue inventada por un mexicano","True"]]
    
    //Nivel Difícil: listado 10 preguntas
    let quiz3 = [
        ["¿Tabasco, Quintana Roo y Yucatán pertenecen a la region Sureste?","True"],
        ["¿La zona Arqueológica Paquimé està en Jalisco?","False"],
        ["México se encuentra en Sur América","False"],
        ["Tlaxcala es el estado más pequeño", "True"],
        ["Pueblo Olmeca crearon las cabezas Colosales","True"],
        ["El frijol fue el alimento principal de los pueblos mesoamericanos","False"],
        ["México solía llamarse la Nueva España","True"],
        ["5 de mayo se celebra el día de la bandera","False"],
        ["Día de Muertes es una festividad importante de México","True"],
        ["La T.V. de color fue inventada por un mexicano","True"]]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        VidasJ01 = 3
        VidasJ02 = 3
        vidasJ1.text = String(VidasJ01)
        vidasJ2.text = String(VidasJ02)
       
    }
    
    
    //MARK: Reiniciar
    @IBAction func Reiniciar(_ sender: Any) {
        
        pregunta.text = "¿Cuánto conoces de México?"
        
        VidasJ01 = 3
        VidasJ02 = 3
        vidasJ1.text = String(VidasJ01)
        vidasJ2.text = String(VidasJ02)
        
        turno = 1
        
        basico = false
        inter = false
        difi = false
        
        btnBasico.isEnabled = true
        btnInter.isEnabled = true
        btnDificl.isEnabled = true
    }
    
    //MARK: Métodos de lanzar
    //Lanzar lista 1
    func lanzar()->Int{
        let aleatorio = Int.random(in: 0...quiz.count-1)
        pregunta.text = quiz[aleatorio][0]
        
        return aleatorio
    }
    
    //Lanzar lista 2
    func lanzar2()->Int{
        let aleatorio = Int.random(in: 0...quiz2.count-1)
        pregunta.text = quiz2[aleatorio][0]
        
        return aleatorio
    }
    
    
    //Lanzar lista 3
    func lanzar3()->Int{
        let aleatorio = Int.random(in: 0...quiz3.count-1)
        pregunta.text = quiz3[aleatorio][0]
        
        return aleatorio
    }
    
    
    //MARK: Botones activación de niveles
    //NIVEL: Basico
    @IBAction func btnBasico(_ sender: Any) {
        
        anterior = lanzar()
        
        btnInter.isEnabled = false
        btnDificl.isEnabled = false
        
        basico = true
    }
    

    //NIVEL: Intermedio
    @IBAction func btnInter(_ sender: Any) {
        
        anterior = lanzar2()
        
        btnBasico.isEnabled = false
        btnDificl.isEnabled = false
        
        inter = true
    }
    
    
    
    //NIVEL: Dificil
    @IBAction func btnDificl(_ sender: Any) {
        
        anterior = lanzar3()
        
        btnBasico.isEnabled = false
        btnInter.isEnabled = false
        
        difi = true
        
    }
    
    @IBAction func jugar(_ sender: UIButton) {
        
        //if para condicionar el tipo de lista a usar para guardar la respuestaActual
        //NIVEL ELEGIDO - Juego
        if(basico == true){
            
            if(turno == 1){
                
                Jugador1lbl.isHighlighted = true
                Jugador1lbl.highlightedTextColor = UIColor.purple
                let respuestaActual = quiz[anterior][1]
                let respuestaUsuario = sender.currentTitle ?? ""
                print(respuestaUsuario)
                
                if (respuestaUsuario != respuestaActual){
                    VidasJ01 -= 1
                    
                }
                
                vidasJ1.text = String(VidasJ01)
                anterior = lanzar()
                Jugador2lbl.isHighlighted = false
                turno = 2
                
            }else if(turno == 2){
                
                Jugador2lbl.isHighlighted = true
                Jugador2lbl.highlightedTextColor = UIColor.purple
                let respuestaActual = quiz[anterior][1]
                let respuestaUsuario = sender.currentTitle ?? ""
                print(respuestaUsuario)
                
                if (respuestaUsuario != respuestaActual){
                    VidasJ02 -= 1
                }
                
                vidasJ2.text = String(VidasJ02)
                anterior = lanzar()
                Jugador1lbl.isHighlighted = false
                turno = 1
            }
            
        }else if(inter == true){
            
            if(turno == 1){
                
                Jugador1lbl.isHighlighted = true
                Jugador1lbl.highlightedTextColor = UIColor.purple
                let respuestaActual = quiz2[anterior][1]
                let respuestaUsuario = sender.currentTitle ?? ""
                print(respuestaUsuario)
                
                if (respuestaUsuario != respuestaActual){
                    VidasJ01 -= 1
                    
                }
                
                vidasJ1.text = String(VidasJ01)
                anterior = lanzar2()
                Jugador2lbl.isHighlighted = false
                turno = 2
                
            }else if(turno == 2){
                
                Jugador2lbl.isHighlighted = true
                Jugador2lbl.highlightedTextColor = UIColor.purple
                let respuestaActual = quiz2[anterior][1]
                let respuestaUsuario = sender.currentTitle ?? ""
                print(respuestaUsuario)
                
                if (respuestaUsuario != respuestaActual){
                    VidasJ02 -= 1
                }
                
                vidasJ2.text = String(VidasJ02)
                anterior = lanzar2()
                Jugador1lbl.isHighlighted = false
                turno = 1
            }
            
        }else if(difi == true){
            if(turno == 1){
                
                Jugador1lbl.isHighlighted = true
                Jugador1lbl.highlightedTextColor = UIColor.purple
                let respuestaActual = quiz3[anterior][1]
                let respuestaUsuario = sender.currentTitle ?? ""
                print(respuestaUsuario)
                
                if (respuestaUsuario != respuestaActual){
                    VidasJ01 -= 1
                    
                }
                
                vidasJ1.text = String(VidasJ01)
                anterior = lanzar3()
                Jugador2lbl.isHighlighted = false
                turno = 2
                
            }else if(turno == 2){
                
                Jugador2lbl.isHighlighted = true
                Jugador2lbl.highlightedTextColor = UIColor.purple
                let respuestaActual = quiz3[anterior][1]
                let respuestaUsuario = sender.currentTitle ?? ""
                print(respuestaUsuario)
                
                if (respuestaUsuario != respuestaActual){
                    VidasJ02 -= 1
                }
                
                vidasJ2.text = String(VidasJ02)
                anterior = lanzar3()
                Jugador1lbl.isHighlighted = false
                turno = 1
            }
        }
        
        
    
        
        
        //JUAGADOR GANADOR
        if(VidasJ01 == 0)
        {
            Alerta(titulo: "GANADOR", texto: "Jugador 02")
            Player2QA+=1
            scoreJ2Txt.text = String(Player2QA)
            
        }else if (VidasJ02 == 0)
        {
            Alerta(titulo: "GANADOR", texto: "Jugador 01")
            Player1QA+=1
            scoreJ1Txt.text = String(Player1QA)
        }
        
        
                
        
    }
    
    @objc func Alerta(titulo: String, texto: String){
        
        let alertController = UIAlertController(title: titulo, message:
                                                    texto, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    

}
