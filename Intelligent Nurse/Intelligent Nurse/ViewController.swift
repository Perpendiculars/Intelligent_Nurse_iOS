//
//  ViewController.swift
//  Intelligent Nurse
//
//  Created by  Daria Firsova on 30/10/2018.
//  Copyright © 2018  Daria Firsova. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController {
    
    @IBOutlet weak var WebView: WKWebView!
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController) {
            UIDevice.current.setValue(Int(UIInterfaceOrientation.portrait.rawValue), forKey: "orientation")
        }
        
    }
    @objc func canRotate() -> Void {}
    override func viewDidLoad() {
        canRotate()
        //WebView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2));
        super.viewDidLoad()
        let url = URL(string: "http://nursecloud.azurewebsites.net/Translation/Get/" + (UserDefaults.standard.string(forKey: "Token"))!)
        print(url)
        let request = URLRequest(url: url!)
        WebView.load(request)
    }

}

