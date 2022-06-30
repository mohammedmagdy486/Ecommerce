//
//  RoundedImage.swift
//  Ecommerce
//
//  Created by AMN on 5/26/22.
//

import UIKit

struct CorneredViewViewModel {
    let viewCornerRadius: CGFloat?
    let viewBorderWidth: CGFloat?
}

class CorneredView: UIView {
    @IBInspectable var viewCornerRadius : CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = viewCornerRadius
        }
    }
    @IBInspectable var viewBorderWidth : CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = viewBorderWidth
        }
    }

    override  func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = #colorLiteral(red: 0.9049928784, green: 0.9163855314, blue: 0.9161852002, alpha: 1)
        self.layer.shadowRadius = 10.0
        self.layer.cornerRadius = viewCornerRadius
        self.layer.borderWidth = viewBorderWidth
    }
    
    func viewCornerConfiguration (with viewModel: CorneredViewViewModel) {
        self.layer.cornerRadius = viewCornerRadius
        self.layer.borderWidth = viewBorderWidth
    }
}

