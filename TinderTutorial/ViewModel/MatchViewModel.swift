//
//  MatchViewModel.swift
//  TinderTutorial
//
//  Created by Renzo Alvaroshan on 22/06/22.
//

import Foundation

struct MatchViewModel {
    private let currentUser: User
    let matchedUser: User
    
    let matchLabelText: String
    
    var currentUserImageURL: URL?
    var matchedUserImageURL: URL?
    
    init(currentUser: User, matchedUser: User) {
        self.currentUser = currentUser
        self.matchedUser = matchedUser
        
        matchLabelText = "You and \(matchedUser.name) have liked each other!"
        
        guard let imageURLString = currentUser.imageURLs.first else { return }
        guard let matchedImageURLString = matchedUser.imageURLs.first else { return }
        
        currentUserImageURL = URL(string: imageURLString)
        matchedUserImageURL = URL(string: matchedImageURLString)
    }
}
