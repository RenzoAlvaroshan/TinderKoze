//
//  MatchCellViewModel.swift
//  TinderTutorial
//
//  Created by Renzo Alvaroshan on 25/06/22.
//

import Foundation

struct MatchCellViewModel {
    
    let nameText: String
    let profileImageURL: URL
    let uid: String
    
    init(match: Match) {
        self.nameText = match.name
        self.profileImageURL = URL(string: match.profileImageURL)!
        uid = match.uid
    }
}
