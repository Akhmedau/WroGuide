//
//  RegistrationViewController.swift
//  WroGuide(1)
//
//  Created by АХМЕДОВ НИКОЛАЙ on 13/06/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    private var db: DataBase!
    private var rootView: RegistrationView!
    
    // MARK: Life Cycle and overridden methods

    override func loadView() {
        db = DataBase()
        rootView = RegistrationView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        rootView.skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        
        rootView.usernameTextField.delegate = self
        rootView.passwordTextField.delegate = self
        
        rootView.usernameTextField.returnKeyType  = .next
        rootView.passwordTextField.returnKeyType  = .done
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootView.usernameTextField.text = ""
        rootView.passwordTextField.text = ""
        rootView.statusLabel.text = ""
    }
    
    // MARK: Actions

    @objc private func registerButtonTapped(_ sender: UIButton) {
        let username = rootView.usernameTextField.text ?? ""
        let password = rootView.passwordTextField.text ?? ""
        
        guard !username.isEmpty, !password.isEmpty else {
            let status = "The Name and Password fields cannot be empty"
            rootView.statusLabel.text = status
            return
        }
        
        if db.users.contains(where: { $0.username == username && $0.password == password }) {
            let user = User(username: username, password: password)
            presentMainScene(with: user)
        } else {
            let status = "For logging use: \nusername: \(db.users.first!.username) \npassword: \(db.users.first!.password)"
            rootView.statusLabel.text = status
        }
    }
    
    @objc private func skipButtonTapped() {
        let nextViewController = NextViewController()
        nextViewController.modalPresentationStyle = .fullScreen
        present(nextViewController, animated: true, completion: nil)
    }
    
    private func presentMainScene(with user: User) {
        let ViewController = ViewController_MVC()
        ViewController.user = user
        ViewController.modalPresentationStyle = .fullScreen
        present(ViewController, animated: true)
    }
}

// MARK: - UITextFieldDelegate

extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case rootView.usernameTextField:
            rootView.passwordTextField.becomeFirstResponder()
        case rootView.passwordTextField:
            rootView.passwordTextField.resignFirstResponder()
            rootView.registerButton.sendActions(for: .touchUpInside)
        default:
            break
        }
        
        return true
    }
}


