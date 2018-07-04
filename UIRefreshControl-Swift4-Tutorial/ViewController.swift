//
//  ViewController.swift
//  UIRefreshControl-Swift4-Tutorial
//
//  Created by Aman Aggarwal on 01/05/18.
//  Copyright © 2018 Aman Aggarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tblList: UITableView!
    
    var refreshControl: UIRefreshControl?
    var titleArray:[String] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        titleArray.append("Swift")
        titleArray.append("Objective C")
        tblList.tableFooterView = UIView.init(frame: .zero)
        tblList.dataSource = self
        addRefreshControl()
    }
    
    func addRefreshControl() {
        
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = UIColor.red
        refreshControl?.addTarget(self, action: #selector(refreshList), for: .valueChanged)
        tblList.addSubview(refreshControl!)
    }
    
    @objc func refreshList() {
        titleArray.append("Kotlin")
        titleArray.append("Java")
        refreshControl?.endRefreshing()
        tblList.reloadData()
    }

    //MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "listcell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "listcell")
        }
        cell?.textLabel?.text = titleArray[indexPath.row]
        return cell!
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

