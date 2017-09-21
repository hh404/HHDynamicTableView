//
//  String+AnyObject.swift
//  TableViewWithMultipleCellTypes
//
//  Created by huangjianwu on 2017/9/19.
//  Copyright © 2017年 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

extension String {
    
    func convertToClass<T>() -> T.Type? {
        return StringClassConverter<T>.convert(string: self)
    }
    
}

class StringClassConverter<T> {
    
    static func convert(string className: String) -> T.Type? {
        guard let nameSpace = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String else {
            return nil
        }
        guard let aClass: T.Type = NSClassFromString("\(nameSpace).\(className)") as? T.Type else {
            return nil
        }
        return aClass
        
    }
    
}
