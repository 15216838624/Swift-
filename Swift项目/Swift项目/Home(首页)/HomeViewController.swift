//
//  HomeViewController.swift
//  Swift项目
//
//  Created by 韩李涛 on 2021/6/23.
//

import UIKit
import Moya
class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = dynamicColor(.red, .yellow)
  
        
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
