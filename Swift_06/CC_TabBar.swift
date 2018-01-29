//
//  CC_TabBar.swift
//  Swift_06
//
//  Created by 陈孟迪 on 2017/11/27.
//  Copyright © 2017年 陈孟迪. All rights reserved.
//

import UIKit

class CC_TabBar: UITabBar {

    var centerButton : UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let topView = UIView.init(frame: CGRect.init(x: 0, y: -1, width: UIScreen.main.bounds.size.width, height: 1))
        topView.backgroundColor = UIColor.lightGray
        self.addSubview(topView)
        
        let button = UIButton.init(type: .custom)
        button.bounds = CGRect.init(x: 0, y: 0, width: 64, height: 64)
        button.setImage(UIImage.init(named: "plus"), for: .normal)
        self.centerButton = button
        self.addSubview(button)
        
        
        
    }
    //layoutSubviews是对subviews重新布局。比如，我们想更新子视图的位置的时候，可以通过调用 默认是不做任何事情的，用到的时候，需要在子类进行重写。
    override func layoutSubviews() {
        super.layoutSubviews()
        self.centerButton?.center = CGPoint.init(x: self.frame.size.width*0.5, y: self.frame.size.height*0.1)
        var index:CGFloat = 0
        for i in 0..<self.subviews.count {
        
            let sub = self.subviews[i]
            if sub.isKind(of: NSClassFromString("UITabBarButton")!){
               
                sub.frame.origin.x = index * self.frame.size.width * 0.2
                index += 1
                if index == 2 {
                    index += 1
                }
                
            }
            
        }
        
    }
    
    func hitTset(point:CGPoint,event:UIEvent) -> UIView {
        
        if self.isHidden == true {
            let newPoint = self.convert(point, to: self.centerButton)
            if (self.centerButton?.point(inside: newPoint, with: event))!{
                return self.centerButton!
            }else{
                return super.hitTest(point, with: event)!
            }
            
        }else{
            return super.hitTest(point, with: event)!
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
