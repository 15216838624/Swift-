//
//  MineViewController.swift
//  Swift项目
//
//  Created by 韩李涛 on 2021/6/24.
//

import UIKit

class MineViewController: BaseTableViewContoller {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = dynamicColor(.white,.red)
        self.tableView.snp.makeConstraints { make in
              make.left.right.equalToSuperview()
              make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
              make.bottom.equalTo(self.view.snp.bottom)
          }
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.setUpWithDataSource(array: [1,2,3], cellBlock:{
            indext,model in
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indext)
              if indext.row == 0 {
                 cell.textLabel?.text = "中文"
              }else{
                 cell.textLabel?.text = "英文"
              }
            return cell
                                 
        }, cellHeight: {
            index,modle in
            return 44
        })

    }
}

extension MineViewController
{

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
