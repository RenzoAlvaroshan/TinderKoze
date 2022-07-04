//
//  Match.swift
//  TinderTutorial
//
//  Created by Renzo Alvaroshan on 25/06/22.
//

import Foundation

struct Match {
    let name: String
    let profileImageURL: String
    let uid: String
    
    init(dictionary: [String: Any]) {
        self.name = dictionary["name"] as? String ?? ""
        self.profileImageURL = dictionary["profileImageURL"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
    }
}
