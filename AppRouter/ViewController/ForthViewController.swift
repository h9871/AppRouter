//
//  ForthViewController.swift
//  AppRouter
//
//  Created by 유현재 on 24/03/2019.
//  Copyright © 2019 유현재. All rights reserved.
//

import UIKit

class ForthViewController: CustomViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
        // button(firstScreen)
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.setTitle("Next Screen", for: .normal)
        button.sizeToFit()
        button.center = self.view.center
        self.view.addSubview(button)
    }
}

extension ForthViewController {
    @objc
    func buttonTapped(_ sender: UIButton) {
        AppRouter.shared.request(.thirdScreen)
    }
}
