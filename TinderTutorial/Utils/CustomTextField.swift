//
//  CustomTextField.swift
//  TinderTutorial
//
//  Created by Renzo Alvaroshan on 07/06/22.
//

import UIKit

class CustomTextField: UITextField {
    
    init(placeholder: String, isSecureField: Bool? = false) {
        super.init(frame: .zero)
        
        let spacer = UIView()
        spacer.setDimensions(height: 50, width: 12)
        leftView = spacer
        leftViewMode = .always
        
        borderStyle = .none
        textColor = .white
        backgroundColor = UIColor(white: 1, alpha: 0.2)
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        layer.cornerRadius = 5
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        isSecureTextEntry = isSecureField!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
