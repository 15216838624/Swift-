//
//  UILable+Extension.swift
//  Swift项目
//
//  Created by 韩李涛 on 2021/6/26.
//

import UIKit

extension UILabel {
    convenience  init(title:String,font:CGFloat? = nil
                      ,color:UIColor) {
        self.init()
        if let fon = font {
            self.font = UIFont.systemFont(ofSize: fon);
        }
        self.text = title;
        self.textColor = color;
    }
    
}
