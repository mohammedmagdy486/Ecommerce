//
//  AppColor.swift
//  Ecommerce
//
//  Created by AMN on 6/5/22.
//

import Foundation
import UIKit
enum APPColor {

    case gradientFirstColor
    case orangeSecondColor
   

    var uiColor: UIColor {
        switch self {
        case .gradientFirstColor:
            return UIColor(red: 0.4, green: 0.505, blue: 0.92, alpha: 1)
        case .orangeSecondColor:
            return UIColor(red: 0.392, green: 0.772, blue: 0.99, alpha: 1)
        }
    }
}
