//
//  AuthManager.swift
//  InstagramClone
//
//  Created by Nitin Gupta on 30/04/22.
//

import Foundation
import FirebaseAuth

class AuthManager {
    
    //MARK: - shared Object
    static let shared = AuthManager()
    
    //MARK: - Authentication
    public func registerNewUser(username:String, email: String, password: String, completion: @escaping (Result<AuthDataResult?, AuthError>) -> Void){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard let result = result, error == nil else {
                completion(.failure(.signupFailed))
                return
            }
            completion(.success(result))
        }
    }
    
    public func loginUser(username:String?, email: String?, password: String, completion: @escaping (Result<AuthDataResult?, AuthError>) -> Void){
        if let emailID = email {
            //login via email
            Auth.auth().signIn(withEmail: emailID, password: password) { result, error in
                guard let result = result, error == nil else  {
                    completion(.failure(.loginFailed))
                    return
                }
                completion(.success(result))
            }
        }
        if let user = username {
            //login via username
            print(user)
        }
    }
    
    public func signOUt(){
        do{
            try Auth.auth().signOut()
        }
        catch {
            print("error \(error.localizedDescription)")
        }
    }
}
