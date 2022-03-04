//
//  LaunchViewController.swift
//  Dabb
//
//  Created by thamizharasan t on 02/03/22.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            
        let isOpen = UserDefaults.standard.bool(forKey: "isOpen")
        if isOpen == true {
            performSegue(withIdentifier: "loginVc", sender: nil)
            
        }else {
            performSegue(withIdentifier: "initialVc", sender: nil)

        }
    }
    

}
