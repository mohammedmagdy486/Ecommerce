//
//  ItemCell.swift
//  Ecommerce
//
//  Created by AMN on 5/27/22.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateItemCell (data: ItemModel){
        itemName.text = data.itemName
        itemPrice.text = ("\(data.itemPrice)")
        itemImage.image = UIImage(named: data.itemImage)
    }
    func updateFeaturedItemWithCD(data:FeaturedItemCD){
        itemName.text = data.itemName
        itemPrice.text = ("\(data.itemPrice)")
        itemImage.image = UIImage(named: data.itemImage ?? "")
    }
    func updateBestItemWithCD(data: BestItemCD){
        itemName.text = data.itemName
        itemPrice.text = ("\(data.itemPrice)")
        itemImage.image = UIImage(named: data.itemImage ?? "")
    }
}
