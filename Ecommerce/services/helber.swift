//
//  helber.swift
//  Ecommerce
//
//  Created by AMN on 6/12/22.
//

import Foundation
func delay ( durationInSeconds seconds: Double, completion: @escaping () -> Void){
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}
