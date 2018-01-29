//
//  MyTabBarViewController.swift
//  Swift_06
//
//  Created by 陈孟迪 on 2017/11/27.
//  Copyright © 2017年 陈孟迪. All rights reserved.
//

import UIKit

class MyTabBarViewController: UITabBarController {

    static var index:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.tabBar.isTranslucent = false
        addChildVc(viewController: OneViewController(), title: "第一页", imageName: "tabBar_home", selsectedImageName: "tabBar_home_click", isHiddenNavgationBar: false)
        addChildVc(viewController: TwoViewController(), title: "第二页", imageName: "tabBar_find", selsectedImageName: "tabBar_find_click", isHiddenNavgationBar: false)
        addChildVc(viewController: ThreeViewController(), title: "第三页", imageName: "tabBar_find", selsectedImageName: "tabBar_find_click", isHiddenNavgationBar: false)
        addChildVc(viewController: FourViewController(), title: "第四页", imageName: "tabBar_me", selsectedImageName: "tabBar_me_click", isHiddenNavgationBar: false)
        
        
        setCustomTabBar()
    }
    
    func setCustomTabBar() {
       
        let tabBar:CC_TabBar = CC_TabBar()
        self.setValue(tabBar, forKey: "tabBar")
        tabBar.centerButton?.addTarget(self, action: #selector(centerClick(sender:)), for: .touchUpInside)
        
    }
    
    @objc func centerClick(sender:UIButton)  {
        
        print("................")
    }
    
    func addChildVc(viewController:UIViewController,title:NSString,imageName:NSString,selsectedImageName:NSString,isHiddenNavgationBar:Bool) {
        
        /*
         UIImageRenderingMode枚举值来设置图片的renderingMode属性。该枚举中包含下列值：
         .Automatic  // 根据图片的使用环境和所处的绘图上下文自动调整渲染模式。
         .AlwaysOriginal   // 始终绘制图片原始状态，不使用Tint Color。
         .AlwaysTemplate   // 始终根据Tint Color绘制图片，忽略图片的颜色信息。
         */
        var im:UIImage = UIImage.init(named: imageName as String)!
        var seleIm:UIImage = UIImage.init(named: selsectedImageName as String)!
        
        im = im.withRenderingMode(.alwaysOriginal)
        seleIm = seleIm.withRenderingMode(.alwaysOriginal)
        
        viewController.navigationItem.title = title as String
        viewController.tabBarItem.title  = title as String
        
        //显示的默认的蓝色
//        viewController.tabBarItem.image = UIImage.init(named: imageName as String)
//        viewController.tabBarItem.selectedImage = UIImage.init(named: selsectedImageName as String)
        
        //显示的原始图片的颜色
        viewController.tabBarItem.image = im
        viewController.tabBarItem.selectedImage = seleIm
        
        //Swift中，如果是一个SomeClass的static变量someStaticValue，则调用时，不能直接使用someStaticValue，而要写成SomeClass.someStaticValue的形式才可以。即便是在当前自己的类里面，也要写成SomeClass.someStaticValue才可以
        viewController.tabBarItem.tag = MyTabBarViewController.index
       MyTabBarViewController.index += 1
        
        let na = MynavigationViewController.init(rootViewController: viewController)
        if isHiddenNavgationBar {
            na.navigationBar.isHidden = true
        }
        self.addChildViewController(na)
    }
}
