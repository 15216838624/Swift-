//
//  MineViewController.swift
//  Swift项目
//
//  Created by 韩李涛 on 2021/6/24.
//

import UIKit

class MineViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = dynamicColor(.white,.red)
        let tableview = UITableView()
        view.addSubview(tableview)
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        
    }

    
    
    

}
extension MineViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        if indexPath.item == 0 {
            cell.textLabel?.text = "中文"
        }else{
            cell.textLabel?.text = "英文"
        }
        
        return cell
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            LangueManger.switchToLangue(langue: LangueEnum.chinese)
        }else{
            LangueManger.switchToLangue(langue: LangueEnum.english)
        }
        
        let str =  Bundle.main.localizedString(forKey: "test", value: "", table:nil)
             
             testPrint(str)

    }
    
    
}
