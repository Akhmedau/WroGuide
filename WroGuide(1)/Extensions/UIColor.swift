//
//  UIColor.swift
//  WroGuide(1)
//
//  Created by АХМЕДОВ НИКОЛАЙ on 16/06/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import UIKit

extension UIColor {
    static let customGradientStart = UIColor(red: 241/255, green: 102/255, blue: 94/255, alpha: 1)
    static let customGradientEnd = UIColor(red: 171/255, green: 140/255, blue: 228/255, alpha: 1)
    static let customButtonBackground = UIColor(red: 78/255, green: 205/255, blue: 196/255, alpha: 1)
    
    static func applyGradientLayer(view: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.customGradientStart.cgColor,
            UIColor.customGradientEnd.cgColor
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
