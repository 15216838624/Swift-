//
//  UIStackView+Extension.swift
//  Swift项目
//
//  Created by 韩李涛 on 2021/6/26.
//

import UIKit



extension UIStackView{
    //水平方向上布局
    convenience  init(horizonItems:[UIView],_ spaceing:CGFloat,_ target:Any? = nil,_ acion:Selector? = nil) {
      self.init()
        self.spacing = spacing;
        self.alignment = .center;
        self.translatesAutoresizingMaskIntoConstraints = false;
        for (_,obj) in horizonItems.enumerated() {
            obj.translatesAutoresizingMaskIntoConstraints = false
            obj.isUserInteractionEnabled = true
            self.addArrangedSubview(obj)
        }
        guard let any = target, let ac = acion   else {
            return
        }
        let tapgesture = UITapGestureRecognizer(target: any, action: ac)
        self.addGestureRecognizer(tapgesture)
    }
    
    //垂直方向上布局
    convenience  init(verticalItems:[UIView],_ spaceing:CGFloat,_ target:Any? = nil,_ acion:Selector? = nil) {
      self.init()
        self.spacing = spacing;
        self.alignment = .center;
        self.axis = .vertical;
        self.translatesAutoresizingMaskIntoConstraints = false;
        for (_,obj) in verticalItems.enumerated() {
            obj.translatesAutoresizingMaskIntoConstraints = false
            obj.isUserInteractionEnabled = true
            self.addArrangedSubview(obj)
        }
        guard let any = target, let ac = acion   else {
            return
        }
        let tapgesture = UITapGestureRecognizer(target: any, action: ac)
        self.addGestureRecognizer(tapgesture)
    }
}
