//
//  HttpRequestManager.swift
//  HHDynamicTableView
//
//  Created by huangjianwu on 2017/9/20.
//  Copyright © 2017年 huangjianwu. All rights reserved.
//

import UIKit
import HandyJSON

struct APIClient<T: HandyJSON> {

    func fetchUsers() -> (_ completion: @escaping(_ items: [T]?, _ error: Error?) -> Void) -> Void {
        return { completion in
                    guard let data = dataFromFile("Demo")else {
                        return
                    }
//            let jsonString = String(data: data, encoding: String.Encoding.utf8)
//            print(jsonString ?? <#default value#>)
//            if let mappedObject = JSONDeserializer<User<HandyJSON>>.deserializeFrom(json: jsonString) { // 从字符串转换为对象实例
//                print(mappedObject.userInfo)
//            }
//            var user1 = T()
//            var user = User<HandyJSON>()
//            user.userInfo.name = "张三"
//            user.userInfo.nickName = "张三的昵称"
//            user.userPraise.followingLabel = "赞"
//            user.userPraise.followingID = "1"
//            //user1 = user
//            var str =  user.toJSONString()
//            print(str)
//            var tempItems = [T]()
//            tempItems.append(user1)
//            completion(tempItems, nil)
        }
    }
}
