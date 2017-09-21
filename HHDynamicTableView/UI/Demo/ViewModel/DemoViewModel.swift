//
//  DemoViewModel.swift
//  HHDynamicTableView
//
//  Created by huangjianwu on 2017/9/20.
//  Copyright © 2017年 huangjianwu. All rights reserved.
//

import UIKit

enum DemoViewModelItemType: String{
    case userInfo = "DoubleLabelTCell"
    case userPraise = "LabelButtonTCell"
}

protocol DemoViewModelItemProtocol {
    var type: DemoViewModelItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}

class DemoViewModel: NSObject {
    var items = [DemoViewModelItemProtocol]()
    
    override init() {
        super.init()
        self.dataMock()
//        guard let data = dataFromFile("ServerData"), let profile = Profile(data: data) else {
//            return
//        }
//        
//        if let name = profile.fullName, let pictureUrl = profile.pictureUrl {
//            let nameAndPictureItem = ProfileViewModelNamePictureItem(name: name, pictureUrl: pictureUrl)
//            items.append(nameAndPictureItem)
//        }
//        
//        if let about = profile.about {
//            let aboutItem = ProfileViewModelAboutItem(about: about)
//            items.append(aboutItem)
//        }
//        
//        if let email = profile.email {
//            let dobItem = ProfileViewModelEmailItem(email: email)
//            items.append(dobItem)
//        }
//        
//        let attributes = profile.profileAttributes
//        if !attributes.isEmpty {
//            let attributesItem = ProfileViewModeAttributeItem(attributes: attributes)
//            items.append(attributesItem)
//        }
//        
//        let friends = profile.friends
//        if !profile.friends.isEmpty {
//            let friendsItem = ProfileViewModeFriendsItem(friends: friends)
//            items.append(friendsItem)
//        }
    }
    
    func dataMock() {
        var user = User()
        user.userInfo.name = "张三"
        user.userInfo.nickName = "张三的昵称"
        user.userPraise.followingLabel = "赞"
        user.userPraise.followingID = "1"
        
        let userItem = UserInfoTItem(userInfo: user.userInfo)
        self.items.append(userItem)
        let userPraiseItem = UserPraiseTItem(userPraise: user.userPraise)
        self.items.append(userPraiseItem)
    }
}

extension DemoViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        let cl:String = item.type.rawValue
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cl)!
        cell.config(withItem: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].sectionTitle
    }
}


class UserInfoTItem: DemoViewModelItemProtocol {
    var type: DemoViewModelItemType {
        return .userInfo
    }
    
    var sectionTitle: String {
        return "Main Info"
    }
    
    var rowCount: Int {
        return 1
    }
    
    var userInfo: User.UserInfo
    
    init(userInfo: User.UserInfo) {
        self.userInfo = userInfo
    }
}

class UserPraiseTItem: DemoViewModelItemProtocol {
    var type: DemoViewModelItemType {
        return .userPraise
    }
    
    var sectionTitle: String {
        return "About"
    }
    
    var rowCount: Int {
        return 1
    }
    
    var userPraise: User.UserPraise
    
    init(userPraise: User.UserPraise) {
        self.userPraise = userPraise
    }
}

