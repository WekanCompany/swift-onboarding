//
//  HomeViewController.swift
//  Swift_OnBoarding
//
//  Created by Santhosh Kumar on 25/03/20.
//  Copyright © 2020 WeKanCode. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationController!.setNavigationBarHidden(false, animated: false)
        title = "Home View"
    }
}
