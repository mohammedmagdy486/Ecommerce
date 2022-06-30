//
//  cartTVCell.swift
//  Ecommerce
//
//  Created by AMN on 6/25/22.
//

import UIKit

class CartTVCell: UITableViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemFinalPrice: UILabel!
    @IBOutlet weak var itemPriceBeforeDiscount: UILabel!
    @IBOutlet weak var itemSize: UILabel!
    @IBOutlet weak var itemColorView: CorneredView!
    @IBOutlet weak var deleteItem: UIButton!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var numberOfItemView: CorneredView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.layer.cornerRadius = 10
        mainView.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        mainView.layer.shadowRadius = 10
        mainView.layer.shadowOpacity = 100
        mainView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        mainView.layer.borderWidth = 1
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    func updateCell(data:CartCellCD){
        itemName.text = data.itemName
        itemImage.image = UIImage(named: data.itemImage ?? "")
        itemFinalPrice.text = ("\(data.itemPrice)")
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "\(data.itemPriceBeforeDiscount)$")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        itemPriceBeforeDiscount.attributedText = attributeString
        itemSize.text = data.itemSize
        print(data.itemColor)
        itemColorView.backgroundColor = UIColor(named: "\(data.itemColor ?? "")")
    }
    
}
