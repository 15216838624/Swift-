//
//  ViewController.swift
//  Swift项目
//
//  Created by 韩李涛 on 2021/6/23.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }
      func shouldAutorotate() -> Bool {
        return false
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        if viewControllerToPresent.modalPresentationStyle == .pageSheet {
            viewControllerToPresent.modalPresentationStyle = .fullScreen
        }
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}

