//
//  MainViewController.swift
//  Swift项目
//
//  Created by 韩李涛 on 2021/6/23.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = .red

        let path =  Bundle.main.path(forResource:"MainVCSettings.json", ofType: nil)!
        let data = NSData(contentsOfFile: path)
        guard let array   =  try? JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments) as? [[String:Any]] else{
            return
        }
      
        for (_,dict) in array.enumerated(){
            
            let childVcName = dict["vcName"] as? String ?? ""
            
            let title = dict["title"] as? String ?? ""

            let imageName = dict["imageName"] as? String ?? ""
          
            addChildViewController(childVcName, title, imageName)
        }
        
    }
    
    private func addChildViewController(_ childVcName:String, _ title:String, _ imageName: String) {
        guard   let childVc = ClassFromString(childVcName) else{
            return;
        }

        childVc.title = title
        childVc.tabBarItem.image = UIImage(named: imageName)
        let childNav = HTNavigationController(rootViewController: childVc)
        addChild(childNav)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return self.selectedViewController?.supportedInterfaceOrientations ?? .portrait
    }
    override var shouldAutorotate: Bool{
        return self.selectedViewController?.shouldAutorotate ?? false
    }
}
