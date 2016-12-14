//
//  ViewController.swift
//  FCRadiusShadowTableView
//
//  Created by liujianlin on 2016/12/14.
//  Copyright © 2016年 xdream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tableView = UITableView(frame: CGRect(x: 20, y: 20, width: view.bounds.width-40, height: view.bounds.height-40), style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.clipsToBounds = false
        tableView.backgroundColor = UIColor.clear
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        view.addSubview(tableView)
        view.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.addShadow(inTableView: tableView, atIndexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
        cell.textLabel?.text = "列表\(indexPath.section)\(indexPath.row)"
        cell.backgroundColor = UIColor.clear
        cell.contentView.backgroundColor = UIColor.white
        return cell
    }
}

