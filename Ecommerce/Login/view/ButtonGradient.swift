//
//  ButtonGradient.swift
//  Ecommerce
//
//  Created by AMN on 5/22/22.
//
import Foundation
import UIKit
struct gradientButtonModel {
    let firstColor : UIColor?
    let lastColor : UIColor?
    let firstPointX: CGFloat?
    let lastPointX: CGFloat?
    let firstPointY: CGFloat?
    let lastPointY: CGFloat?
}

 class ButtonGradient: UIButton {
     
     @IBInspectable var buttonCornerRadius: CGFloat = 0
     @IBInspectable var buttonBorderWidth: CGFloat = 0
    func addGradientConfiguration (with viewModel: gradientButtonModel) {
        let button = CAGradientLayer()
        button.frame = self.bounds
        button.colors = [viewModel.firstColor?.cgColor ?? .init(gray: 0.1, alpha: 0.1), viewModel.lastColor?.cgColor ?? .init(gray: 0.1, alpha: 0.1)]
        button.startPoint = CGPoint(x: viewModel.firstPointX ?? 0 , y: viewModel.firstPointY ?? 0)
        button.endPoint = CGPoint(x: viewModel.lastPointX ?? 1, y: viewModel.lastPointY ?? 1)
        button.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.cornerRadius = buttonCornerRadius
        button.borderWidth = buttonBorderWidth
        self.layer.cornerRadius = buttonCornerRadius
        self.layer.borderWidth = buttonBorderWidth
        self.layer.insertSublayer(button, at: 0)
        button.layoutSublayers()
        self.layer.masksToBounds = true
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
