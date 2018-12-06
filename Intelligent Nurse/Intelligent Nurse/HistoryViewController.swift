//
//  HistoryViewController.swift
//  Intelligent Nurse
//
//  Created by Garanya Kvasnikov on 06/12/2018.
//  Copyright © 2018  Daria Firsova. All rights reserved.
//

import UIKit
import WebKit
class HistoryViewController: UIViewController {
    
    @IBOutlet weak var WebView: WKWebView!
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if (self.isMovingFromParentViewController) {
            UIDevice.current.setValue(Int(UIInterfaceOrientation.portrait.rawValue), forKey: "orientation")
        }
    }
    func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .landscape
    }
    @objc func canRotate() -> Void {}
    override func viewDidLoad() {
        //canRotate()
        //WebView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2));
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeRight.rawValue;
        UIDevice.current.setValue(value, forKey: "orientation")
        let url = URL(string: "http://nursecloud.azurewebsites.net/Archive/GetTranslation/acwnbfd8")
        print(url)
        let request = URLRequest(url: url!)
        WebView.load(request)
        //        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        //        navigationItem.leftBarButtonItem = backButton
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(buttonAction))
    }
    
    @objc func buttonAction(sender: UIBarButtonItem!) {
        //let url = URL(string: "http://nursecloud.azurewebsites.net/Translation/Stop/" + (UserDefaults.standard.string(forKey: "Token"))!)
        //print(url)
        //let request = URLRequest(url: url!)
        //WebView.load(request)
        self.navigationController?.popViewController(animated: true)
    }
}

