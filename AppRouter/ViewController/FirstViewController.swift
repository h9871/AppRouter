//
//  FirstViewController.swift
//  AppRouter
//
//  Created by 유현재 on 24/03/2019.
//  Copyright © 2019 유현재. All rights reserved.
//

import UIKit

class FirstViewController: CustomViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // button(secondScreen)
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.setTitle("Next", for: .normal)
        button.sizeToFit()
        button.center = self.view.center
        button.tag = 1
        self.view.addSubview(button)
        
        // button(forthScreen)
        let button2 = UIButton(type: .system)
        button2.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button2.setTitle("Move ForthView", for: .normal)
        button2.sizeToFit()
        button2.center = CGPoint(x: button.center.x, y: button.center.y + 50)
        button2.tag = 2
        self.view.addSubview(button2)
    }
}

extension FirstViewController {
    @objc
    func buttonTapped(_ sender: UIButton) {
        if sender.tag == 1 {
            AppRouter.shared.request(.secondScreen)
        } else {
            AppRouter.shared.request(.forthScreen)
        }
    }
}
