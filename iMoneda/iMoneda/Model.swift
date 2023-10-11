//
//  Model.swift
//  iMoneda
//
//  Created by Manuel Gómez Cámara on 11/10/23.
//

import Foundation

enum Tirada : String{
    case cara, cruz
}


class Moneda{
    
    
    func lanzar() -> Tirada{
        let tirada = Bool.random()
        
        if (tirada){
            return Tirada.cara
        }
        return Tirada.cruz
    }
}
