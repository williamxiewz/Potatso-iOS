//
//  CurrentGroupCell.swift
//  Potatso
//
//  Created by LEI on 4/13/16.
//  Copyright © 2016 TouchingApp. All rights reserved.
//

import UIKit
import Cartography
import PotatsoLibrary

class CurrentGroupCell: UITableViewCell {
    
    var switchVPN: (()->Void)?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(switchButton)
        setupLayout()
    }
    // MARK: 连接和断开调用的方法
    func onSwitchValueChanged() {
        switchVPN?()
    }
    
    func config(name: String?, status: Bool, switchVPN: (() -> Void)?) {
        nameLabel.text = name ?? "None".localized()
        switchButton.setBackgroundImage("FF6959".color.alpha(0.76).toImage(), for: .Normal)
        
        switchButton.addTarget(self, action: #selector(self.onSwitchValueChanged), for: .TouchUpInside)
        switchButton.setTitle((status ? "Disconnect" : "Connect").localized(), for: .Normal)
        switchButton.setBackgroundImage((status ? "FF6959" : "1ABC9C").color.alpha(0.76).toImage(), for: .Normal)
        
        self.switchVPN = switchVPN
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        constrain(nameLabel, switchButton, contentView) { nameLabel, switchButton, superView in
            nameLabel.leading == superView.leading
            nameLabel.centerY == superView.centerY
            nameLabel.trailing == switchButton.leading - 15
            
            switchButton.centerY == superView.centerY
            switchButton.trailing == superView.trailing - 10
            switchButton.width == 70
            switchButton.height == 27
        }
    }
    
    lazy var nameLabel: UILabel = {
        let v = UILabel()
        v.font = UIFont.boldSystemFont(ofSize: 17)
        v.textColor = UIColor.whiteColor
        return v
    }()
    
    lazy var switchButton: UIButton = {
        let v = UIButton(type: .custom)
        v.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        v.layer.cornerRadius = 4
        v.layer.masksToBounds = true
        v.clipsToBounds = true
        return v
    }()

    
}
