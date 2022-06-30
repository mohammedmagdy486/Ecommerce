//
//  RoundedImage.swift
//  Ecommerce
//
//  Created by AMN on 5/26/22.
//

import UIKit

struct CorneredImageViewModel {
    let imageCornerRadius: CGFloat?
    let imageBorderWidth: CGFloat?
}

class CorneredImage: UIImageView {
    @IBInspectable var imageCornerRadius : CGFloat = 0{
        didSet{
            self.layer.cornerRadius = imageCornerRadius
        }
    }
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = #colorLiteral(red: 0.9049928784, green: 0.9163855314, blue: 0.9161852002, alpha: 1)
        self.layer.shadowRadius = 10.0
    }
    
    func imageCornerConfiguration (with viewModel: CorneredImageViewModel) {
        self.layer.cornerRadius = imageCornerRadius
        self.layer.borderWidth = viewModel.imageBorderWidth ?? 1
    }
}
