//
//  Phone.swift
//  Intelligent Nurse
//
//  Created by  Daria Firsova on 06/12/2018.
//  Copyright © 2018  Daria Firsova. All rights reserved.
//
import UIKit

class PhoneViewController: UIViewController, UITextFieldDelegate
{
    
    @IBAction func PhoneButton(_ sender: UIButton) {
        let number = ChangePhoneText.text
        UserDefaults.standard.set(number, forKey: "Phone")
        print(number)
        
    }
    
    @IBOutlet weak var ChangePhoneText: UITextField!
    override func viewDidLoad() {
        UserDefaults.standard.set(1, forKey: "FirstTime1")
        if (UserDefaults.standard.integer(forKey: "FirstTime1") == 1)
        {
            ChangePhoneText.text = UserDefaults.standard.string(forKey: "Phone")
            ChangePhoneText.delegate = self
        }
        
    }
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
