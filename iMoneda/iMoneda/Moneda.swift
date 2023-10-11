//
//  Moneda.swift
//  iMoneda
//
//  Created by Manuel Gómez Cámara on 11/10/23.
//

import Foundation

enum Tirada : String {
    case cara, cruz
}

class Moneda{
    
    func lanzar() -> Tirada
    {
        if(Bool.random())
        {
            return Tirada.cara
        }else{
            return Tirada.cruz
        }
    }
}
