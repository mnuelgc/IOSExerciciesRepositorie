//
//  Carta.swift
//  7yMedia
//
//  Created by Manuel Gómez Cámara on 24/10/23.
//

struct Carta{
    var valor : Int;
    var palo : Palo;

    init?(_ valor : Int, _ palo: Palo){
        if (valor < 1){
            print ("El valor de la carta no puede ser inferior a 1");
            return nil;
        }
        if (valor > 12){
            print ("El valor de la carta no puede superar 12");
            return nil;
        }
        if (valor == 8 || valor == 9){
            print ("Los números 8 y 9 no se usan");
            return nil;
        }
        self.valor = valor;
        self.palo = palo;
    }
    func descripcion()-> String {
        return "el \(valor) de \(palo.rawValue)"
    }
}
