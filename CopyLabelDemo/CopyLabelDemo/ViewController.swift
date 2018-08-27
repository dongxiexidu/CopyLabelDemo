//
//  ViewController.swift
//  CopyLabelDemo
//
//  Created by fashion on 2018/8/27.
//  Copyright © 2018年 shangZhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let copyLabel = CopyLabel.init(frame: CGRect.init(x: 0, y: 100, width: 100, height: 40))
        copyLabel.text = "CopyLabel Test"
        copyLabel.backgroundColor = UIColor.yellow
        view.addSubview(copyLabel)
    }

    


}

