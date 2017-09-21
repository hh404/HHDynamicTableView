//
//  ViewController.swift
//  HHDynamicTableView
//
//  Created by huangjianwu on 2017/9/20.
//  Copyright © 2017年 huangjianwu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate let viewModel = DemoViewModel()
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView = UITableView(frame: CGRect(x: 0, y: 100, width: 250, height: 300), style: .plain)
        
        
        tableView?.dataSource = viewModel
        
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableViewAutomaticDimension
    
        tableView?.register(DoubleLabelTCell.self, forCellReuseIdentifier: "DoubleLabelTCell")
        tableView?.register(LabelButtonTCell.self, forCellReuseIdentifier: "LabelButtonTCell")
        self.view.addSubview(tableView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

