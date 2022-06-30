//
//  ButtonGradient.swift
//  Ecommerce
//
//  Created by AMN on 5/22/22.
//
import Foundation
import UIKit

 class CorneredButton: UIButton {
     @IBInspectable var buttonCornerRadius : CGFloat = 0{
         didSet{
             self.layer.cornerRadius = buttonCornerRadius
         }
     }
     
     @IBInspectable var buttonBorderWidth : CGFloat = 0{
         didSet{
             self.layer.borderWidth = buttonBorderWidth
         }
     }
     
    override init (frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = #colorLiteral(red: 0.9049928784, green: 0.9163855314, blue: 0.9161852002, alpha: 1)
        self.layer.shadowRadius = 10.0
        self.layer.shadowColor = #colorLiteral(red: 0.9049928784, green: 0.9163855314, blue: 0.9161852002, alpha: 1)
    }
    
}
