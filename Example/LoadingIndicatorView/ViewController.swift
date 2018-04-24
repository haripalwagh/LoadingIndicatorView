//
//  ViewController.swift
//  LoadingIndicatorView
//
//  Created by haripalwagh@gmail.com on 04/24/2018.
//  Copyright (c) 2018 haripalwagh@gmail.com. All rights reserved.
//

import UIKit
import LoadingIndicatorView

class ViewController: UIViewController {
    
    var apiActivityIndicatorView = LoadingIndicatorView.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnShowHUDTapped(_ sender: Any) {
        apiActivityIndicatorView.showHUD()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    @IBAction func btnHideHUDTapped(_ sender: Any) {
        apiActivityIndicatorView.hideHUD()
    }

}

