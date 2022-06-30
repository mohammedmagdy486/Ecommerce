//
//  CategoryTVCell.swift
//  Ecommerce
//
//  Created by AMN on 5/27/22.
//

import UIKit

class CategoryTVCell: UITableViewCell {
    
    @IBOutlet weak var categoryBackView: CorneredView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryImage: CorneredImage!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCategoryCell (data: CategoryModel){
        categoryName.text = data.categoryName
        categoryImage.image = UIImage(named: data.categoryImage)
    }
    
    
}
