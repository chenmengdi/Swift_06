//
//  MynavigationViewController.swift
//  Swift_06
//
//  Created by 陈孟迪 on 2017/11/27.
//  Copyright © 2017年 陈孟迪. All rights reserved.
//

import UIKit

class MynavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
     self.isNavigationBarHidden = true
     self.isToolbarHidden = true
        
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count>0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }
}
