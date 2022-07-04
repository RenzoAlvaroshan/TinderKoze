//
//  ProfileCell.swift
//  TinderTutorial
//
//  Created by Renzo Alvaroshan on 18/06/22.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    let imageView = UIImageView()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "jane2")
        
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
