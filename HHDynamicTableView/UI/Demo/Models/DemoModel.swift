//
//  DemoModel.swift
//  HHDynamicTableView
//
//  Created by huangjianwu on 2017/9/20.
//  Copyright © 2017年 huangjianwu. All rights reserved.
//

import Foundation
import HandyJSON

public func dataFromFile(_ filename: String) -> Data? {
    @objc class TestClass: NSObject { }
    
    let bundle = Bundle(for: TestClass.self)
    if let path = bundle.path(forResource: filename, ofType: "json") {
        return (try? Data(contentsOf: URL(fileURLWithPath: path)))
    }
    return nil
}

struct User: HandyJSON{
    struct UserInfo: HandyJSON {
        var name = ""
        var nickName = ""
    }
    
    struct UserPraise: HandyJSON {
        var followingLabel = ""
        var followingID = ""
    }
    
    var userInfo = UserInfo()
    var userPraise = UserPraise()
    
    
}


