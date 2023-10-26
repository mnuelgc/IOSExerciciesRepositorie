//
//  ViewController.swift
//  7yMedia
//
//  Created by Raquel Guerrero Perucho on 23/10/23.
//

import UIKit

class ViewController: UIViewController {

    var juego : Juego!
    var viewsCartas : [UIImageView] = []
    
    let limitesPantalla = UIScreen.main.bounds
    var anchoPantalla : CGFloat = 0.0
    var altoPantalla : CGFloat = 0.0
    
    var posXInit : Int = 0
    var posYInit : Int = 0
    var posXFinal : Int = 0
    var posYFinal : Int = 0
    
    var cardWidthInit : Int = 0
    var cardWidthFinal : Int = 0
    
    var cardHeightInit : Int = 0
    var cardHeightFinal : Int = 0
    
    @IBOutlet weak var AskCardButton: UIButton!
    
    @IBOutlet weak var StandThereButton: UIButton!
    
    @IBOutlet weak var NewGameButton: UIButton!
    
    @IBOutlet weak var UserNotification: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AskCardButton.isEnabled = false
        StandThereButton.isEnabled = false
        anchoPantalla = limitesPantalla.width
        altoPantalla = limitesPantalla.height
        
        posXInit = -200
        posYInit = -200
        posXFinal = Int(self.anchoPantalla * (0.05 + CGFloat(self.viewsCartas.count) * 0.075))
        posYFinal = Int(self.altoPantalla * 0.1)
        
        cardWidthInit = Int(self.anchoPantalla * 0.5)
        cardHeightInit = Int(self.altoPantalla * 0.26)
        
        cardWidthFinal = Int(self.anchoPantalla * 0.25)
        cardHeightFinal = Int(self.altoPantalla * 0.18)
        // Do any additional setup after loading the view.
    }
    
    private func removeCards()
    {
        for v in self.viewsCartas {
            UIView.animate(withDuration: 1) {
                v.frame = CGRect(x: self.posXInit ,y: self.posYInit, width: self.cardWidthFinal, height: self.cardHeightFinal)
                v.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi));
            }
            
            let seconds = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds){
                v.removeFromSuperview()
            }
        }
        self.viewsCartas=[]
    }

    @IBAction func NewGame(_ sender: Any) {
        juego = Juego()
        juego.turnoMaquina()
        
        removeCards()
        
        AskCardButton.isEnabled = true
        StandThereButton.isEnabled = true
        
        NewGameButton.isEnabled = false
        UserNotification.text = "Game Started"
    }
    
    private func paintCard()
    {
        if let card = juego.manoJugador.cartas.last{
            let imagen = UIImage(named: String(card.valor) + card.palo.rawValue)
            let imagenView = UIImageView(image: imagen)
            imagenView.frame = CGRect(x:self.posXInit, y:self.posYInit, width: self.cardWidthInit, height: self.cardHeightInit)
            //La rotamos, para que al "repartirla" haga un efecto de giro
            imagenView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            
            //si estamos en un viewcontroller de una app, NO sería "vc" sino "self"
            self.view.addSubview(imagenView)
            

            let offset = Int(self.anchoPantalla * 0.075 * CGFloat(self.viewsCartas.count))
            let posNewCard = self.posXFinal + offset
            UIView.animate(withDuration: 1) {
                imagenView.frame = CGRect(x: posNewCard, y: self.posYFinal , width: self.cardWidthFinal, height: self.cardHeightFinal)
                imagenView.transform = CGAffineTransform(rotationAngle: CGFloat(0));
            }
            viewsCartas.append(imagenView)
        }
        
    }
    
    @IBAction func AskForCard(_ sender: Any) {
        //Esta parte la puedes tomar como ejemplo para el ejercicio
        let stateAfterPlay = self.juego.jugadorPideCarta()
        self.paintCard()
        
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds){
            self.UserNotification.text = "You have \(self.juego.sumaJugador)"
            
            if  stateAfterPlay != .turnoJugador{
                self.endGame()
            }
        }
        
    }
    
    
    
    @IBAction func Stand(_ sender: Any) {
        
        if (juego.jugadorSePlanta() != .turnoJugador){
            endGame()
        }
    }
    
    private func endGame()
    {
        AskCardButton.isEnabled = false
        StandThereButton.isEnabled = false
        
        NewGameButton.isEnabled = true
        
        if juego.estado == .ganaJugador{
            UserNotification.text = "Your opponent has \(juego.sumaMaquina) \n" + "You win"
        }
        if juego.estado == .pierdeJugador{
            UserNotification.text = "Your opponent has \(juego.sumaMaquina)\n" + "You lose"
        }
        if juego.estado == .empate{
            UserNotification.text = "Your opponent has \(juego.sumaMaquina)\n" + "It's a draw"
        }
        if juego.estado == .sepasaJugador{
            UserNotification.text = "You have \(self.juego.sumaJugador) that is more than 7.5\n You lose"
        }
        
    }
    
}




