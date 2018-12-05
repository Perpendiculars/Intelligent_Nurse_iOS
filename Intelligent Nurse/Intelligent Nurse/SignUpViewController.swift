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
            let params = ["parameters":login! + " " + password! + " " + token!]
            print(params)
            let user_url = "http://nursecloud.azurewebsites.net/SignIn"
//
//            request(user_url, method: .post, parameters: params).validate().responseString { responseString in
//
//                switch responseString.result {
//                case .success(let value):
//                    print(value)
//
//                case .failure(let error):
//                    print(responseString.request?.httpBody!)
//                    print(responseString.request?.httpMethod)
//                    print(responseString.request?.description)
//                }
//            }

            
            Alamofire.request("http://nursecloud.azurewebsites.net/SignIn", method: .post, parameters: params, encoding: URLEncoding.httpBody).responseJSON { response in
                if response.result.isSuccess {
                    print("RABOTAYET, SOBAKA!")
                    print(response.request)  // original URL request
                    print(response.response) // URL response
                    print(response.data)     // server data
                    print(response.result)   // result of response serialization
                }
                else
                {
                    print("RESPONSE: ")
                    print(String.init(data: (response.request?.httpBody)!, encoding: String.Encoding.utf8)!)  // original URL request
                    print(response.request?.value)  // original URL request

                    print(response.request)  // original URL request
                    print(response.response!) // URL response
                    print(String.init(data: response.data!, encoding: String.Encoding.utf8)!)     // server data
                    print(response.result)   // result of response serialization
                }
            }
        }
    }
}
