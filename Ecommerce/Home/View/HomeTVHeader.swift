//
//  HomeTVHeader.swift
//  Ecommerce
//
//  Created by AMN on 6/18/22.
//

import UIKit

class HomeTableHeader: UITableViewHeaderFooterView {
    static let identifier = "HomeTableHeader"
    
    var seeAllBtn : UIButton = {
        let seeAllBtn = UIButton()
        seeAllBtn.setTitle("See ALL", for: .normal)
        seeAllBtn.setTitleColor(UIColor.gray, for: .normal)
        seeAllBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return seeAllBtn
    }()
    
    var sectionTitle : UILabel = {
        let sectionTitle = UILabel()
        sectionTitle.font = UIFont.systemFont(ofSize: 22)
        return sectionTitle
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(seeAllBtn)
        contentView.addSubview(sectionTitle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        seeAllBtn.sizeToFit()
        seeAllBtn.frame = CGRect(x: contentView.frame.size.width - 10 - seeAllBtn.frame.size.width, y: 5, width: seeAllBtn.frame.size.width, height: seeAllBtn.frame.size.height)
        sectionTitle.frame = CGRect(x: 20, y: 0, width: 100, height: 30)
    }
    
}
