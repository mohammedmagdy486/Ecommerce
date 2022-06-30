//
//  UiLabelExt.swift
//  Ecommerce
//
//  Created by AMN on 6/26/22.
//

import UIKit

extension UILabel {
    func seeMoreLessText(tag: Int,text: String){
        let seeMoreOrLess = tag == 0 ? " see more": " see less"
        var allSting = text as NSString
        if allSting.length >= 150 {
            if tag == 0 {
                allSting = allSting.substring(with: NSRange(location: 0, length: allSting.length > 150 ? 150 : allSting.length)) as NSString
            }
            let handeledAllString = allSting as String + seeMoreOrLess as NSString
            let finalHandeledAllString = NSMutableAttributedString(string: handeledAllString as String)
            let rangeSeeMoreHandeled = handeledAllString.range(of: seeMoreOrLess, options: .regularExpression, range: NSMakeRange(0,handeledAllString.length))
            if rangeSeeMoreHandeled.length > 0 {
                finalHandeledAllString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: rangeSeeMoreHandeled)
            }
            self.attributedText = finalHandeledAllString
        }
       
    }
}
