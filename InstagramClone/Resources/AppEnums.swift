//
//  AppEnums.swift
//  InstagramClone
//
//  Created by Nitin Gupta on 30/04/22.
//

import Foundation
import UIKit

enum Placeholder: String {
    case emailUser = "Enter Username or Email ID..."
    case password = "Enter Password..."
    case email = "Enter Email ID..."
    case username = "Enter Username..."
}

enum buttonTitle: String {
    case login = "Log In"
    case signUp = "Don't have an Account, Create One"
    case createAccount = "Create Account"
    case terms = "Terms"
    case policy = "Privacy Policy"
    case editProfile = "Edit Profile"
    case blank = ""
    case follow = "Follow"
    case seeAll = "See All"
}

enum labelTitle: String {
    case or = "OR"
    case loginTitle = "Hello again!"
    case createAccount = "Create Account"
    case posts = "Posts"
    case followers = "Followers"
    case followings = "Followings"
    case demoCount = "101"
    case profileName = "Profile Name"
    case discoverPeople = "Discover People"
    case followeeBy = "Followed By"
}

enum AuthError:Error {
    case loginFailed
    case signupFailed
}

enum Axis: String{
    case horizental, vertical
}

enum StackViewDistribution: String{
    case fill, fillEqually, fillProportionlly, equalSpacing, equalCentering
}

enum StackViewAlignment: String{
    case top, center, bottom
}
