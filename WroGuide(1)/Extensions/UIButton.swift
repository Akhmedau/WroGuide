//
//  UIButton.swift
//  WroGuide(1)
//
//  Created by АХМЕДОВ НИКОЛАЙ on 24/06/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setIcon(_ icon: UIImage?) {
        guard let icon = icon else { return }
        self.setImage(icon, for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
        self.contentVerticalAlignment = .fill
        self.contentHorizontalAlignment = .fill
        self.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
