//
//  Configurable.swift
//  HHDynamicTableView
//
//  Created by huangjianwu on 2017/9/20.
//  Copyright © 2017年 huangjianwu. All rights reserved.
//

import Foundation

protocol Configurable{
    associatedtype DataType: Any
    func config(withItem item: DataType)
}
