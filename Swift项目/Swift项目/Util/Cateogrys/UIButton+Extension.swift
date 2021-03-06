//
//  UIButton+Extension.swift
//  Swift项目
//
//  Created by 韩李涛 on 2021/6/26.
//

import UIKit

extension UIButton {
    convenience  init(title:String,font:CGFloat, imageName:String? = nil,backImageName:String? = nil) {
        self.init()
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize:font)
        if let image = imageName {
            self.setImage(UIImage.init(named: image), for: .normal)
        }
        if let backImage = backImageName {
            self.setBackgroundImage(UIImage.init(named: backImage), for: .normal)
        }
    }
}
