//
//  SignUpViewController.swift
//  Intelligent Nurse
//
//  Created by  Daria Firsova on 27/11/2018.
//  Copyright © 2018  Daria Firsova. All rights reserved.
//

import Alamofire
import UIKit

class SignUpViewController: UIViewController
{
    
    @IBOutlet weak var PasswordText: UITextField!
    @IBOutlet weak var LoginText: UITextField!
    @IBOutlet weak var TokenText: UITextField!
    
    @IBAction func SignUpButton(_ sender: UIButton) {
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
            let params = [
                "Token" : token,
                "Password" : password,
                "Email" : login
            ]
            let user_url = URL(string: "https://intelligentnurse.azurewebsites.net/SignIn/")
            var request = URLRequest(url: user_url!)
            request.httpMethod = "POST"
            let postData = (token! + " " + login! + " " + password!)
            Alamofire.request(user_url!, method: .post, parameters: params).responseJSON { response in
                if response.result.isSuccess {
                    print("RABOTAYET, SOBAKA!")
                }
                else
                {
                    print("ne rabotayet")
                }
            }
        }
    }
}
