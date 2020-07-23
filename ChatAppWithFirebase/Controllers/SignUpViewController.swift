//
//  SignUpViewController.swift
//  ChatAppWithFirebase
//
//  Created by 近藤宏輝 on 2020/07/23.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var profileImageButton: UIButton!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var alreadyHaveAccountButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageButton.layer.cornerRadius = 85
        profileImageButton.layer.borderWidth = 1
        profileImageButton.layer.borderColor = UIColor.rgb(red: 240, green: 240, blue: 240).cgColor
        
        registerButton.layer.cornerRadius = 12
        
    }
}
