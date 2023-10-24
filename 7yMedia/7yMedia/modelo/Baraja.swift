//
//  Baraja.swift
//  7yMedia
//
//  Created by Manuel Gómez Cámara on 24/10/23.
//

class Baraja{
    var cartas : [Carta]
    init(){
        self.cartas = [Carta]()
        
        for palo in [Palo.bastos, Palo.oros, Palo.copas, Palo.espadas]{
            for valor in 1...12{
                if (valor != 8 && valor != 9){
                    var carta = Carta(valor, palo)
                    cartas.append(carta!)
                }
            }
        }
    }
    
    func repartirCarta() -> Carta?{
        if self.cartas.count > 0{
            return self.cartas.popLast()
        }
        return nil
    }
    
    func barajar(){
        self.cartas.shuffle()
    }
}
