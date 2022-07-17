//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by Nitin Gupta on 29/04/22.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    //MARK: - Outlets
    fileprivate let emailTF = Element.shared.textField(placeHolder: .emailUser)
    private let passwordTF = Element.shared.textField(placeHolder: .password,  isSecureField: true)
    private let loginButton = Element.shared.button(title: .login)
    private let signUpButton = Element.shared.buttonWithoutBorder(title: .signUp, titleColor: .systemTeal)
    private let termsButton = Element.shared.buttonWithoutBorder(title: .terms, titleColor: .systemTeal)
    private let policyButton = Element.shared.buttonWithoutBorder(title: .policy, titleColor: .systemTeal)
    private let titleLabel = Element.shared.label(title: .loginTitle, size: AppConstanst.Font.titleFont, weight: .bold)
    private let orLabel = Element.shared.label(title: .or)
    
    //MARK: - LifeCycle Func
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginVC()
        addSubviews()
        //add targets to button
        setupTargets()
        confirmingDelegates()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //frames
        titleLabel.frame = CGRect(x: view.leading + 40, y: view.top + 140, width: 250, height: 70)
        emailTF.frame =  CGRect(x: view.leading + 20, y: view.top + 400, width: view.width - 40, height: 45)
        passwordTF.frame =  CGRect(x: view.leading + 20, y: emailTF.bottom + 25, width: view.width - 40, height: 45)
        loginButton.frame =  CGRect(x: view.leading + 20, y: passwordTF.bottom + 40, width: view.width - 40, height: 45)
        orLabel.frame = CGRect(x: (view.width - 30) / 2, y: loginButton.bottom + 25, width: 60, height: 30)
        signUpButton.frame = CGRect(x: view.leading + 20, y: orLabel.bottom + 25, width: view.width - 40, height: 45)
        termsButton.frame = CGRect(x: 80, y: view.bottom - 80, width: 100, height: 30)
        policyButton.frame = CGRect(x: view.width / 2 - 20, y: view.bottom - 80, width: 150, height: 30)
    }
    
    //MARK: - Functions
    func setupLoginVC() {
        title = "Login"
        view.backgroundColor = .systemTeal
        //apply curved view
        let curvedView  = CurvedView()
        view.layer.addSublayer(curvedView.getCurvedView())
    }
    
    func setupTargets() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(termButtonTapped), for: .touchUpInside)
        policyButton.addTarget(self, action: #selector(policyButtonTapped), for: .touchUpInside)
    }
    
    func addSubviews() {
        view.addSubview(emailTF)
        view.addSubview(passwordTF)
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        view.addSubview(termsButton)
        view.addSubview(policyButton)
        view.addSubview(orLabel)
        view.addSubview(titleLabel)
    }
    
    func confirmingDelegates() {
        emailTF.delegate = self
        passwordTF.delegate = self
        
    }
    
    @objc func loginButtonTapped() {
        print("login button tapped")
        guard let emailUsername = emailTF.text, !emailUsername.isEmpty,
              let password = passwordTF.text, !password.isEmpty, password.count >= 6 else {
                  print("validation failed")
                  return
              }
        var email:String? = nil
        var username:String? = nil
        if emailUsername.contains("@"), emailUsername.contains(".") {
            email = emailUsername
        }
        else{
            username = emailUsername
        }
        AuthManager.shared.loginUser(username: username, email: email, password: password) { result in
            switch result {
            case .success(let result):
                guard let result = result else {
                    print("there must be some error. login data not found")
                    return
                }
                GlobalMethods.shared.saveUserDetails(uid: result.user.uid, email: result.user.email ?? "Not Known.")
            case .failure(let error):
                print("error in login: \(error)")
            }
        }
    }
    
    @objc func createAccountButtonTapped() {
        print("create account button tapped")
        let signUpVC = RegistrationViewController()
        present(signUpVC, animated: true, completion: nil)
    }
    
    @objc func termButtonTapped() {
        print("term button tapped")
        guard let url = URL(string: APPURL.terms) else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
        
    }
    
    @objc func policyButtonTapped() {
        print("policy button tapped")
        guard let url = URL(string: APPURL.privacy) else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTF {
            emailTF.resignFirstResponder()
            passwordTF.becomeFirstResponder()
        }
        else if textField == passwordTF {
            passwordTF.resignFirstResponder()
            loginButtonTapped()
        }
        return true
    }
}


