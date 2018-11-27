//
//  LoginViewController.swift
//  Intelligent Nurse
//
//  Created by  Daria Firsova on 27/11/2018.
//  Copyright © 2018  Daria Firsova. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{
    
    
    @IBAction func LoginButton(_ sender: UIButton) {
        let login = LoginText.text
        let password = PasswordText.text
        let token = TokenText.text
        UserDefaults.standard.set(1, forKey: "FirstTime")
        UserDefaults.standard.set(login, forKey: "Login")
        UserDefaults.standard.set(password, forKey: "Password")
        UserDefaults.standard.set(token, forKey: "Token")
        let alertView = UIAlertController(title: "Login Problem",
                                          message: "Wrong username or password.",
                                          preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Foiled Again!", style: .default)
        alertView.addAction(okAction)
        present(alertView, animated: true, completion: nil)
    }
    
    @IBOutlet weak var LoginText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    @IBOutlet weak var TokenText: UITextField!
    
    override func viewDidLoad() {
        if (UserDefaults.standard.integer(forKey: "FirstTime") == 1)
        {
            LoginText.text = UserDefaults.standard.string(forKey: "Login")
            PasswordText.text = UserDefaults.standard.string(forKey: "Password")
            TokenText.text = UserDefaults.standard.string(forKey: "Token")
        }
    }
    
}

