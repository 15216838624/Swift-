//
//  BaseTableViewContoller.swift
//  Swift项目
//
//  Created by 韩李涛 on 2021/6/27.
//

import UIKit
typealias getCellBlock = (IndexPath,Any) -> UITableViewCell
typealias getCellheightBlock = (IndexPath,Any) -> CGFloat
class BaseTableViewContoller: BaseViewController{
   private var getCell:(getCellBlock)?
   private var cellHeightBlock:(getCellheightBlock)?
   private lazy var dataSource = [Any]()
   lazy var tableView:UITableView = {
        let tableview = UITableView()
        self.view.addSubview(tableview)
        tableview.estimatedRowHeight = 0;
        tableview.tableFooterView = UIView()
        tableview.dataSource = self
        tableview.delegate = self
        return tableview;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func setUpWithDataSource(array:[Any],cellBlock:@escaping (getCellBlock),cellHeight:@escaping (getCellheightBlock)) {
        self.dataSource = array
        self.getCell = cellBlock
        self.cellHeightBlock = cellHeight
    }
}
extension BaseTableViewContoller:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modle =  self.dataSource[indexPath.row];
        let cell = self.getCell!(indexPath,modle)
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let modle =  self.dataSource[indexPath.row];
        return self.cellHeightBlock?(indexPath,modle) ?? 44
    }
}

extension BaseTableViewContoller:UITableViewDelegate{
    
    
}
