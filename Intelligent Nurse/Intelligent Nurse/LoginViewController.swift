//
//  LoginViewController.swift
//  Intelligent Nurse
//
//  Created by  Daria Firsova on 27/11/2018.
//  Copyright © 2018  Daria Firsova. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController
{
    
    
    @IBAction func LoginButton(_ sender: UIButton) {
        if (LoginText.text == "" || PasswordText.text == "" || TokenText.text == "") {
            let alert = UIAlertController(title: "Аттеншн", message: "Введите данные", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ну ладно", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            let login = LoginText.text
            let password = PasswordText.text
            let token = TokenText.text
            UserDefaults.standard.set(1, forKey: "FirstTime")
            UserDefaults.standard.set(login, forKey: "Login")
            UserDefaults.standard.set(password, forKey: "Password")
            UserDefaults.standard.set(token, forKey: "Token")
            let headers: HTTPHeaders = ["parameters":login! + " " + password! + " " + token!]
            print(headers)
            let user_url = "http://nursecloud.azurewebsites.net/Login"
            Alamofire.request(user_url, method: .post, encoding: URLEncoding.httpBody, headers: headers).responseString { response in
                if ((response.response?.statusCode)! == 200) {
                    print((response.response?.statusCode)!)
                    self.performSegue(withIdentifier: "Menu", sender: self)
                }
                else {
                    print((response.response?.statusCode)!)
                    let alert = UIAlertController(title: "Warning", message: "Wrong data", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
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

