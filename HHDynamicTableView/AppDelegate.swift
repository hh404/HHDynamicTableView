//
//  AppDelegate.swift
//  HHDynamicTableView
//
//  Created by huangjianwu on 2017/9/20.
//  Copyright © 2017年 huangjianwu. All rights reserved.
//

import UIKit
import HandyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        let a = APIClient<User<HandyJSON>.UserInfo>().fetchUsers()
//        a { (items, error) -> Void in
//        }
//        
        self.test()
        return true
    }
    
    func test() {
        // 假设这是服务端返回的统一定义的response格式
        class BaseResponse<T: HandyJSON>: HandyJSON {
            var code: Int? // 服务端返回码
            var data: T? // 具体的data的格式和业务相关，故用泛型定义
            
            public required init() {}
        }
        
        // 假设这是某一个业务具体的数据格式定义
        struct SampleData: HandyJSON {
            var id: Int?
        }
        
        let sample = SampleData(id: 2)
        let resp = BaseResponse<SampleData>()
        resp.code = 200
        resp.data = sample
        
        let jsonString = resp.toJSONString()! // 从对象实例转换到JSON字符串
        print(jsonString) // print: {"code":200,"data":{"id":2}}
        
        if let mappedObject = JSONDeserializer<BaseResponse<SampleData>>.deserializeFrom(json: jsonString) { // 从字符串转换为对象实例
            print(mappedObject.data?.id)
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

