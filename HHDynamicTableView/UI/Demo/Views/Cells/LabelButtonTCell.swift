
//
//  LabelButtonTCell.swift
//  HHDynamicTableView
//
//  Created by huangjianwu on 2017/9/20.
//  Copyright © 2017年 huangjianwu. All rights reserved.
//

import UIKit
import SnapKit

class LabelButtonTCell: UITableViewCell {
    var hTextLabel: UILabel?
    var hButton: UIButton?
    
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
        hTextLabel = UILabel()
        self.contentView.addSubview(hTextLabel!)
        hTextLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(10)
            make.top.equalTo(4)
            make.height.equalTo(30)
            make.width.equalTo(100)
        })
        
        hButton = UIButton()
        self.contentView.addSubview(hButton!)
        hButton?.snp.makeConstraints({ (make) in
            make.left.equalTo((hTextLabel?.snp.right)!).offset(10)
            make.top.equalTo((hTextLabel?.snp.bottom)!).offset(10)
            make.height.equalTo(30)
            make.width.equalTo(100)
        })
    }
    
    override func config(withItem item: DataType){
        let item1:UserPraiseTItem = item as! UserPraiseTItem
        hTextLabel?.text = item1.userPraise.followingID
        hButton?.setTitle(item1.userPraise.followingLabel, for: .normal)
    }
}
