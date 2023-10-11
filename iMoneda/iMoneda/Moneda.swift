//
//  Moneda.swift
//  iMoneda
//
//  Created by Manuel Gómez Cámara on 11/10/23.
//

import Foundation

enum Tirada : String {
    case head, tails
}

class Moneda{
    
    func lanzar() -> Tirada
    {
        if(Bool.random())
        {
            return Tirada.head
        }else{
            return Tirada.tails
        }
    }
}
