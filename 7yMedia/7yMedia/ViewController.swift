//
//  ViewController.swift
//  7yMedia
//
//  Created by Raquel Guerrero Perucho on 23/10/23.
//

import UIKit

class ViewController: UIViewController {

    var juego : Juego!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func NewGame(_ sender: Any) {
        juego = Juego()
        juego.turnoMaquina()
        print("Start the game")
    }
    
    @IBAction func AskForCard(_ sender: Any) {
        if  juego.jugadorPideCarta() != .turnoJugador{
            endGame()
        }
    }
    
    
    @IBAction func Stand(_ sender: Any) {
        
        if (juego.jugadorSePlanta() != .turnoJugador){
            endGame()
        }
    }
    
    private func endGame()
    {
        
        if juego.estado == .ganaJugador{
            print("Your opponent has \(juego.sumaMaquina)")
            print("You win")
        }
        if juego.estado == .pierdeJugador{
            print("Your opponent has \(juego.sumaMaquina)")
            print("You lose")
        }
        if juego.estado == .empate{
            print("Your opponent has \(juego.sumaMaquina)")
            print("It's a draw")
        }
        if juego.estado == .sepasaJugador{
            print("You have exceeded 7.5")
        }
        
    }
    
}




