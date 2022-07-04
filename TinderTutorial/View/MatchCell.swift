//
//  MatchCell.swift
//  TinderTutorial
//
//  Created by Renzo Alvaroshan on 22/06/22.
//

import UIKit
import SwiftUI

class MatchCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    var viewModel: MatchCellViewModel! {
        didSet {
            usernameLabel.text = viewModel.nameText
            profileImageView.sd_setImage(with: viewModel.profileImageURL)
        }
    }
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 2
        iv.layer.borderColor = UIColor.white.cgColor
        iv.setDimensions(height: 80, width: 80)
        iv.layer.cornerRadius = 80 / 2
        return iv
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stack = UIStackView(arrangedSubviews: [profileImageView, usernameLabel])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.spacing = 6
        
        addSubview(stack)
        stack.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
