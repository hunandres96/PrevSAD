//
//  LogInViewController.swift
//  PrevSad
//
//  Created by Andres Hun on 2/17/19.
//  Copyright © 2019 Andres Hun. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func logInPressed(_ sender: Any) {
        
        if !(emailTextField.text ?? "").isEmpty {
            performSegue(withIdentifier: "goToChat", sender: sender)
        }
    }
}
