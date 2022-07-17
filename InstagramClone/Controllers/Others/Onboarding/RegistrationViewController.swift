//
//  RegistrationViewController.swift
//  InstagramClone
//
//  Created by Nitin Gupta on 29/04/22.
//

import UIKit

class RegistrationViewController: UIViewController {

    //MARK: - Outlets
    private let emailTF = Element.shared.textField(placeHolder: .email)
    private let userNameTF = Element.shared.textField(placeHolder: .username)
    private let passwordTF = Element.shared.textField(placeHolder: .password,  isSecureField: true)
    private let signUpButton = Element.shared.button(title: .createAccount,backgroundColor: UIColor.systemPink)
    private let titleLabel = Element.shared.label(title: .createAccount, size: AppConstanst.Font.titleFont, weight: .bold)
    
    //MARK: - LifeCycle Func
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginVC()
        addSubviews()
        //add targets to button
        setupTargets()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //frames
        titleLabel.frame = CGRect(x: view.leading + 40, y: view.top + 140, width: 350, height: 70)
        emailTF.frame =  CGRect(x: view.leading + 20, y: view.top + 400, width: view.width - 40, height: 45)
        userNameTF.frame = CGRect(x: view.leading + 20, y: emailTF.bottom + 25, width: view.width - 40, height: 45)
        passwordTF.frame =  CGRect(x: view.leading + 20, y: userNameTF.bottom + 25, width: view.width - 40, height: 45)
        signUpButton.frame = CGRect(x: view.leading + 20, y: passwordTF.bottom + 25, width: view.width - 40, height: 45)
    }
    
    //MARK: - Functions
    func setupLoginVC() {
        title = "Login"
        view.backgroundColor = .systemPink
        
        //apply curved view
        let curvedView  = CurvedView()
        view.layer.addSublayer(curvedView.getCurvedView())
    }
    
    func setupTargets() {
        signUpButton.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
    }
    
    func addSubviews() {
        view.addSubview(emailTF)
        view.addSubview(passwordTF)
        view.addSubview(signUpButton)
        view.addSubview(titleLabel)
        view.addSubview(userNameTF)
    }
    
    @objc func createAccountButtonTapped() {
        print("create account button tapped")
        guard let email = emailTF.text, !email.isEmpty,
              let username = userNameTF.text, !username.isEmpty,
              let password = passwordTF.text, !password.isEmpty, password.count >= 6 else {
                  print("validation failed")
                  return
              }
        AuthManager.shared.registerNewUser(username: username, email: email, password: password) { result in
            switch result {
            case .success(let result):
                guard let result = result else {
                    print("there must be some error. login data not found")
                    return
                }
                self.presentingViewController?
                        .presentingViewController?.dismiss(animated: true, completion: nil)
                GlobalMethods.shared.saveUserDetails(uid: result.user.uid, email: result.user.email ?? "Not Known.")
            case .failure(let error):
                print("error in signup: \(error)")
            }
        }
    }
    
}
