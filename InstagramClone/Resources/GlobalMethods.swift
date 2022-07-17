//
//  GlobalMethods.swift
//  InstagramClone
//
//  Created by Nitin Gupta on 01/05/22.
//

import Foundation
import UIKit

class GlobalMethods {
    //MARK: - static object
    static let shared = GlobalMethods()
    
    //MARK: - firebase function
    
    //func to get current user id
    func GetCurrentUserID() {
        
    }
    
    func saveUserDetails(uid:String, email:String) {
        standard.set(uid, forKey: defaults.userID)
        standard.set(email, forKey: defaults.email)
    }
}
