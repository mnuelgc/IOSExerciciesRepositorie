//
//  Mano.swift
//  7yMedia
//
//  Created by Raquel Guerrero Perucho on 24/10/23.
//

class Mano {
    var cartas : [Carta]
    
    init() {
        self.cartas = [Carta]()
    }
    
    var tamaño : Int{
        get{
            return cartas.count
        }
    }
    
    func addCarta( _ carta : Carta){
        self.cartas.append(carta)
    }
    
    func getCarta(pos : Int) -> Carta?{
        if (pos < 0){
            return nil
        }
        if (pos >= cartas.count){
            return nil
        }
        return cartas[pos]
    }
}
