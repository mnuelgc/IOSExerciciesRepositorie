//
//  ViewController.swift
//  iMoneda
//
//  Created by Manuel Gómez Cámaraon 11/10/23.
//

import UIKit

class ViewController: UIViewController {
    let coin = Moneda()

    @IBOutlet weak var coinImage: UIImageView!
    
    
    @IBOutlet weak var coinTextResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ThrowCoin(_ sender: Any) {
        var tirada : Tirada
        
        tirada = coin.lanzar()
        coinImage.image = UIImage(named: tirada.rawValue)
        
        coinTextResult.text = "\(NSLocalizedString("Its", comment: "")) \(NSLocalizedString(tirada.rawValue, comment:""))"
    }
    
}

