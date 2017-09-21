//
//  DoubleLabelTCell.swift
//  HHDynamicTableView
//
//  Created by huangjianwu on 2017/9/20.
//  Copyright © 2017年 huangjianwu. All rights reserved.
//

import UIKit
import SnapKit

class DoubleLabelTCell: UITableViewCell {
    var hText1Label: UILabel?
    var hText2Label: UILabel?
    
    
    // MARK: - Default
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self._setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Private
    func _setupLabel()  {
        hText1Label = UILabel()
        self.contentView.addSubview(hText1Label!)
        hText1Label?.snp.makeConstraints({ (make) in
            make.left.equalTo(10)
            make.top.equalTo(4)
            make.height.equalTo(30)
            make.width.equalTo(100)
        })
        
        hText2Label = UILabel()
        self.contentView.addSubview(hText2Label!)
        hText2Label?.snp.makeConstraints({ (make) in
            make.left.equalTo((hText1Label?.snp.right)!).offset(10)
            make.top.equalTo(4)
            make.height.equalTo(30)
            make.width.equalTo(100)
        })
    }
    
    override func config(withItem item: DataType){
        let item1:UserInfoTItem = item as! UserInfoTItem
        hText1Label?.text = item1.userInfo.name
        hText2Label?.text = item1.userInfo.nickName
    }

}
