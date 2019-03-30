//
//  CustomViewController.swift
//  AppRouter
//
//  Created by 유현재 on 24/03/2019.
//  Copyright © 2019 유현재. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
    private var screen: AppScreen
    
    init(screen: AppScreen) {
        self.screen = screen
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        screen = .firstScreen
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
