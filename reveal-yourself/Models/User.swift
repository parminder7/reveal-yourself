//
//  User.swift
//  reveal-yourself
//
//  Created by Parminder Kaur on 2018-04-14.
//  Copyright © 2018 Parminder Kaur. All rights reserved.
//

import Foundation
import Firebase

struct User {
    let uid: String
    let email: String
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
    
    init(authData: User) {
        self.uid = authData.uid
        self.email = authData.email
    }
}
