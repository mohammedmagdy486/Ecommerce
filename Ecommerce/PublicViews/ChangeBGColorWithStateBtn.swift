//
//  ChangeBGColorWithStateBtn.swift
//  Ecommerce
//
//  Created by AMN on 6/14/22.
//

import Foundation
import UIKit

class ChangeBGColorWithStateBtn: UIButton{
    @IBInspectable var buttonCornerRadius : CGFloat = 0{
        didSet{
            self.layer.cornerRadius = buttonCornerRadius
        }
    }
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = buttonCornerRadius
    }
    
    func setBackGroundColor(selectedColor: UIColor,unSelectedColor: UIColor, state: UIButton.State){
        
        if state == .selected{
            self.backgroundColor = selectedColor
        }
        else {
            self.backgroundColor = unSelectedColor
        }
        self.tintColor = backgroundColor
    }

}
