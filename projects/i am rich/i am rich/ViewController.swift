//
//  ViewController.swift
//  i am rich
//
//  Created by Tan Ren Jie on 6/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loveFace: UILabel!
    @IBOutlet weak var sadFace: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func yesButtonPress(_ sender: UIButton) {
        sadFace.alpha = 0
        loveFace.alpha = 1
    }
    
    
    @IBAction func noButtonPress(_ sender: UIButton) {
        sadFace.alpha = 1
        loveFace.alpha = 0
    }
    
}

