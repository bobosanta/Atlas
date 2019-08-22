//
//  CustomButton.swift
//  Atlas
//
//  Created by Dan Pop on 22/08/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    private func setupButton() {
        layer.cornerRadius  = frame.size.height/2
        setTitleColor(.white, for: .normal)
    }
    
}
