//
//  CategoryCell.swift
//  Ecommerce
//
//  Created by AMN on 5/26/22.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryBackView: CorneredView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryImage: CorneredImage!
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImage.layer.cornerRadius = 5
        categoryBackView.layer.cornerRadius = 5
        // Initialization code
    }
    
    func updateCategoryCell (data: CategoryModel){
        categoryName.text = data.categoryName
        categoryImage.image = UIImage(named: data.categoryImage)
    }
}
