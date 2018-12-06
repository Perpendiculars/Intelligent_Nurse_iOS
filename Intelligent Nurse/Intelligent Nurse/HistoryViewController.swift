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
    @objc func canRotate() -> Void {}
    override func viewDidLoad() {
        self.WebView.scrollView.zoomScale = 0.2
        canRotate()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        super.viewDidLoad()
        let url = URL(string: "http://nursecloud.azurewebsites.net/Archive/Index/" + String(UserDefaults.standard.string(forKey: "Token")!))
        let request = URLRequest(url: url!)
        WebView.load(request)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(buttonAction))
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .landscapeRight
            
        }
    }
    @objc func buttonAction(sender: UIBarButtonItem!) {
        self.navigationController?.popViewController(animated: true)
    }
}

