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

var cantPreJ1 = 0
var cantPreJ2 = 0

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
    var quiz = [
        ["¿El Río Lerma es el más largo de México?", "True"],//0
        ["¿Tabasco, Quintana Roo y Yucatán pertenecen a la region Sureste?","True"],//1
        ["¿La zona Arqueológica Paquimé està en Jalisco?","False"],//2
        ["México se encuentra en Sur América","False"],//3
        ["Guadalajara, Jalisco es la ciudad más grande","True"],//4
        ["Tlaxcala es el estado más pequeño", "True"],//5
        ["Pueblo Olmeca crearon las cabezas Colosales","True"],//6
        ["El frijol fue el alimento principal de los pueblos mesoamericanos","False"],//7
        ["México solía llamarse la Nueva España","True"],//8
        ["5 de mayo se celebra el día de la bandera","False"],//9
        ["Día de Muertes es una festividad importante de México","True"],//10
        ["La T.V. de color fue inventada por un mexicano","True"],//11
        ["El nombre México proviene del nahua","True"],//12
        ["¿México significa -en el ombligo-?","True"],//13
        ["Pico de Orizaba es el momento más alto de México","True"],//14
        ["Chapala es el lago más grande de México","True"],//15
        ["¿El cientifico mexicano Mario Molina aportó estudio sobre la capa de ozono?","True"],//16
        ["Emiliano Zapata declaró la independencia de México","False"],//17
        ["México tiene 31 estados","False"],//18
        ["México es un país megadiverso","True"],//19
        ["PEMEX significa: Petroleros Mexicanos","True"],//20
        ["Flor tradicional del Día de muertos es -cempasúchil-","True"],//21
        ["Símbolos patrios: bandera, escudo y el mariachi","False"],//22
        ["1970 se celebró la Copa Mundial de Fútbolen México","True"],//23
        ["México tiene 2 penínsulas","True"],//24
        ["México solía llamarse -La Nueva España-","True"],//25
        ["Las tres garantías son: religión, independencia y unión de todos los mexicanos","True"],//26
        ["Miguel Hidalgo fue un sacerdote que lideró la primera fase de la Independencia de México","True"],//27
        ["Nombre oficial: Estados unidos Mexicanos","True"],//28
        ["México se encuentra en Norte América","True"],//29
        ["México es una República Federal","True"]]//30
    
    override func viewDidLoad() {
        super.viewDidLoad()

        VidasJ01 = 0
        VidasJ02 = 0
        vidasJ1.text = String(VidasJ01)
        vidasJ2.text = String(VidasJ02)
       
    }
    
    
    //MARK: Reiniciar
    @IBAction func Reiniciar(_ sender: Any) {
        
        pregunta.text = "¿Cuánto conoces de México?"
        
        VidasJ01 = 0
        VidasJ02 = 0
        vidasJ1.text = String(VidasJ01)
        vidasJ2.text = String(VidasJ02)
        
        turno = 1
        
        basico = false
        inter = false
        difi = false
        
        btnBasico.isEnabled = true
        btnInter.isEnabled = true
        btnDificl.isEnabled = true
        
        cantPreJ1=0
        cantPreJ2=0
    }
    
    //MARK: Métodos de lanzar
    //Lanzar lista 1
    func lanzar()->Int{
        let aleatorio = Int.random(in: 0...quiz.count-1)
        pregunta.text = quiz[aleatorio][0]
        
        return aleatorio
    }
    
   
    
    

    
    
    //MARK: Botones activación de niveles
    //NIVEL: Basico
    @IBAction func btnBasico(_ sender: Any) {
        
        anterior = lanzar()
        VidasJ01 = 3
        VidasJ02 = 3
        vidasJ1.text = String(VidasJ01)
        vidasJ2.text = String(VidasJ02)
        
        btnInter.isEnabled = false
        btnDificl.isEnabled = false
        
        basico = true
    }
    

    //NIVEL: Intermedio
    @IBAction func btnInter(_ sender: Any) {
        
        anterior = lanzar()
        VidasJ01 = 2
        VidasJ02 = 2
        vidasJ1.text = String(VidasJ01)
        vidasJ2.text = String(VidasJ02)
        btnBasico.isEnabled = false
        btnDificl.isEnabled = false
        
        inter = true
    }
    
    
    
    //NIVEL: Dificil
    @IBAction func btnDificl(_ sender: Any) {
        
        anterior = lanzar()
        VidasJ01 = 1
        VidasJ02 = 1
        vidasJ1.text = String(VidasJ01)
        vidasJ2.text = String(VidasJ02)
        btnBasico.isEnabled = false
        btnInter.isEnabled = false
        
        difi = true
        
    }
    
    //MARK: JUEGO
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
                    
                }else{
                    cantPreJ1+=1
                }
                //quiz.remove(at: anterior)
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
                }else{
                    cantPreJ2=1
                }
                
                
                //quiz.remove(at: anterior)
                vidasJ2.text = String(VidasJ02)
                
                anterior = lanzar()
                Jugador1lbl.isHighlighted = false
                turno = 1
            }
            
        }else if(inter == true){
            
            if(turno == 1){
                
                Jugador1lbl.isHighlighted = true
                Jugador1lbl.highlightedTextColor = UIColor.purple
                let respuestaActual = quiz[anterior][1]
                let respuestaUsuario = sender.currentTitle ?? ""
                print(respuestaUsuario)
                
                if (respuestaUsuario != respuestaActual){
                    VidasJ01 -= 1
                    
                }else{
                    cantPreJ1+=1
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
                }else{
                    cantPreJ2+=1
                }
                
                vidasJ2.text = String(VidasJ02)
                anterior = lanzar()
                Jugador1lbl.isHighlighted = false
                turno = 1
            }
            
        }else if(difi == true){
            if(turno == 1){
                
                Jugador1lbl.isHighlighted = true
                Jugador1lbl.highlightedTextColor = UIColor.purple
                let respuestaActual = quiz[anterior][1]
                let respuestaUsuario = sender.currentTitle ?? ""
                print(respuestaUsuario)
                
                if (respuestaUsuario != respuestaActual){
                    VidasJ01 -= 1
                    
                }else{
                    cantPreJ1+=1
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
                }else{
                    cantPreJ2+=1
                }
                
                vidasJ2.text = String(VidasJ02)
                anterior = lanzar()
                Jugador1lbl.isHighlighted = false
                turno = 1
            }
        }
        
        
    
        
        //MARK: JUEGO - Ganador
        //JUAGADOR GANADOR
        if(basico==true){
            
            if(VidasJ01 == 0 || cantPreJ2==5)
            {
                Alerta(titulo: "GANADOR", texto: "Jugador 02")
                Player2QA+=1
                scoreJ2Txt.text = String(Player2QA)
                
            }else if (VidasJ02 == 0 || cantPreJ1==5)
            {
                Alerta(titulo: "GANADOR", texto: "Jugador 01")
                Player1QA+=1
                scoreJ1Txt.text = String(Player1QA)
                
            }
            
            
        }else if(inter==true){
            if(VidasJ01 == 0 || cantPreJ2==7)
            {
                Alerta(titulo: "GANADOR", texto: "Jugador 02")
                Player2QA+=1
                scoreJ2Txt.text = String(Player2QA)
                
            }else if (VidasJ02 == 0 || cantPreJ1==7)
            {
                Alerta(titulo: "GANADOR", texto: "Jugador 01")
                Player1QA+=1
                scoreJ1Txt.text = String(Player1QA)
                
            }
            
        }else if(difi==true){
            if(VidasJ01 == 0 || cantPreJ2==10)
            {
                Alerta(titulo: "GANADOR", texto: "Jugador 02")
                Player2QA+=1
                scoreJ2Txt.text = String(Player2QA)
                
            }else if (VidasJ02 == 0 || cantPreJ1==10)
            {
                Alerta(titulo: "GANADOR", texto: "Jugador 01")
                Player1QA+=1
                scoreJ1Txt.text = String(Player1QA)
                
            }
        }
        
        
        
        
        
        
                
        
    }
    
    
    //MARK: Alertas
    @objc func Alerta(titulo: String, texto: String){
        
        let alertController = UIAlertController(title: titulo, message:
                                                    texto, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    

}
