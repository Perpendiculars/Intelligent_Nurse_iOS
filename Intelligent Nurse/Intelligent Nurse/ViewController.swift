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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://vk.com")
        let request = URLRequest(url: url!)
        WebView.load(request)
    }

}

