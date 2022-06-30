//
//  MenuCell.swift
//  Ecommerce
//
//  Created by AMN on 6/4/22.
//

import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var itemName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func updateMenuCell (data: MenuCellModel){
        itemName.text = data.menuCellName
    }
    
    
}
