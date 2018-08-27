//
//  CopyLabel.swift
//  CopyLabelDemo
//
//  Created by fashion on 2018/8/27.
//  Copyright © 2018年 shangZhu. All rights reserved.
//

import UIKit

class CopyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        pressAction()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        pressAction()
    }
    
    private func pressAction()  {
        isUserInteractionEnabled = true
        let longPress = UILongPressGestureRecognizer.init(target: self, action: #selector(longPressAction(gesture:)))
        longPress.minimumPressDuration = 0.25
        self.addGestureRecognizer(longPress)
    }
    // 使label能够成为响应事件
    override var canBecomeFirstResponder: Bool{
        return true
    }
    // 自定义方法时才显示对就选项菜单，即屏蔽系统选项菜单
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(customCopy) {
            return true
        }
        return false
    }
    
    @objc func customCopy() {
        let pasteboard = UIPasteboard.general
        pasteboard.string = self.text
    }
    
    @objc func longPressAction(gesture : UIGestureRecognizer) {
        if gesture.state == .began {
            becomeFirstResponder()
            let copyItem = UIMenuItem.init(title: "拷贝", action: #selector(customCopy))
            let menuController = UIMenuController.shared
            menuController.menuItems = [copyItem]
            if let superV = superview {
               menuController.setTargetRect(self.frame, in: superV)
            }
            menuController.setMenuVisible(true, animated: true)
        }
    }
}
