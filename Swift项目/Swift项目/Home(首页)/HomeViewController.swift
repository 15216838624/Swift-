//
//  HomeViewController.swift
//  Swift项目
//
//  Created by 韩李涛 on 2021/6/23.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = dynamicColor(.white, .yellow)
  
        let lable = UILabel(title: "你好", font:30, color: .green)
        
        let lable1 = UILabel(title: "世界",font:30, color: .blue)
        
        
        let lable2 = UILabel(title: "啊",font:30, color: .purple)
        
        
        let stackView = UIStackView(horizonItems: [lable,lable1,lable2], 20);
        self.view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(300)
        }
        
        Test.test()
        

    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return [.landscapeLeft,.portrait]
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let vc = UIViewController()
//        vc.view.backgroundColor = .yellow
//        self.present(vc, animated: true, completion: nil)

    }
}
