//
//  DetailController.swift
//  Marvel
//
//  Created by Máster Móviles on 3/11/23.
//

import UIKit
import Marvelous

class DetailController: UIViewController {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var bio: UITextView!
    
    var character : RCCharacterObject!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.name.text = self.character.name
        self.bio.text = self.character.bio
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
