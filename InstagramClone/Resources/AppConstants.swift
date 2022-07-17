//
//  AppConstants.swift
//  InstagramClone
//
//  Created by Nitin Gupta on 30/04/22.
//

import Foundation
import UIKit

struct AppConstanst {
    static let cornerRadius = 10.0
    static let borderWidth = 1.0
    static let borderColor = UIColor.lightGray.cgColor
    
    struct Font{
        static let titleFont = 40.0
        static let descriptionFont = 18.0
    }
}

struct Color {
    static let buttonBackgroundColor = UIColor.systemTeal
    static let buttonTitleColor = UIColor.label
}

let standard = UserDefaults.standard

struct defaults{
    static let userID = "userId"
    static let email = "email"
    static let username = "username"
}

struct APPURL {
    static let terms = "https://help.instagram.com/581066165581870"
    static let privacy = "https://help.instagram.com/519522125107875/?maybe_redirect_pol=0"
}


struct Image {
    static let profilePic = "profilePic"
    static let system_person = "person"
    static let crossImg = "multiply"
    static let logo = "logo"
}
