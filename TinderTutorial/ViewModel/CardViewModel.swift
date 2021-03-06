//
//  CardViewModel.swift
//  TinderTutorial
//
//  Created by Renzo Alvaroshan on 06/06/22.
//

import UIKit

class CardViewModel {
    
    let user: User
    let imageURLs: [String]
    let userInfoText: NSAttributedString
    private var imageIndex = 0
    var index: Int { return imageIndex }
    var imageURL: URL?
    
    init(user: User) {
        self.user = user
        
        let attributedText = NSMutableAttributedString(string: user.name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy), .foregroundColor: UIColor.white])
        
        attributedText.append(NSAttributedString(string: "  \(user.age)", attributes: [.font: UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.white]))
        
        self.userInfoText = attributedText
        
//        self.imageURL = URL(string: user.profileImageURL)
        self.imageURLs = user.imageURLs
        self.imageURL = URL(string: self.imageURLs[0])
    }
    
    func showNextPhoto() {
        guard imageIndex < imageURLs.count - 1 else { return }
        imageIndex += 1
        imageURL = URL(string: imageURLs[imageIndex])
    }
    
    func showPreviousPhoto() {
        guard imageIndex > 0 else { return }
        imageIndex -= 1
        imageURL = URL(string: imageURLs[imageIndex])
    }
}
