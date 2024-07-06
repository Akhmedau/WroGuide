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
    private var loginView: LoginView!
    
    // MARK: Life Cycle and overridden methods

    override func loadView() {
        db = DataBase()
        rootView = RegistrationView()
        loginView = LoginView()
        
        let containerView = UIView()
        containerView.addSubview(rootView)
        containerView.addSubview(loginView)
        
        view = containerView
        
        setupConstraints()
        
        // Скрываем loginView по умолчанию
        loginView.isHidden = true
        
        // Устанавливаем делегаты
        rootView.delegate = self
        loginView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.logInButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        rootView.skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        
        rootView.emailTextField.delegate = self
        rootView.passwordTextField.delegate = self
        
        rootView.emailTextField.returnKeyType  = .next
        rootView.passwordTextField.returnKeyType  = .done
        
        rootView.googleButton.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
        rootView.appleButton.addTarget(self, action: #selector(appleButtonTapped), for: .touchUpInside)
        rootView.facebookButton.addTarget(self, action: #selector(facebookButtonTapped), for: .touchUpInside)

        // Устанавливаем constraints еще раз, на случай изменений
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootView.emailTextField.text = ""
        rootView.passwordTextField.text = ""
        rootView.statusLabel.text = ""
    }
    
    // MARK: Actions

    @objc private func registerButtonTapped(_ sender: UIButton) {
        let username = rootView.emailTextField.text ?? ""
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
        let nextViewController = TutorialViewController()
        nextViewController.modalPresentationStyle = .fullScreen
        present(nextViewController, animated: true, completion: nil)
    }
    
    private func presentMainScene(with user: User) {
        let viewController = ViewController_MVC()
        viewController.user = user
        viewController.modalPresentationStyle = .automatic          //- change after \ .fullScreen
        present(viewController, animated: true)
    }
    
    // Actions for social buttons
    @objc private func googleButtonTapped() {
        // Handle Google sign in
    }
    
    @objc private func appleButtonTapped() {
        // Handle Apple sign in
    }
    
    @objc private func facebookButtonTapped() {
        // Handle Facebook sign in
    }

    // Setup constraints for rootView
    private func setupConstraints() {
         rootView.translatesAutoresizingMaskIntoConstraints = false
         loginView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            rootView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rootView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rootView.topAnchor.constraint(equalTo: view.topAnchor),
            rootView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - RegistrationViewDelegate

extension RegistrationViewController: RegistrationViewDelegate {
    func didTapSignInLabel() {
        rootView.isHidden = true
        loginView.isHidden = false
    }
}

// MARK: - LoginViewDelegate

extension RegistrationViewController: LoginViewDelegate {
    func didTapForgotPasswordButton() {
        let forgotPasswordViewController = ForgotPasswordViewController()
        forgotPasswordViewController.modalPresentationStyle = .fullScreen
        present(forgotPasswordViewController, animated: true, completion: nil)
    }
    
    func didTapSignUpButton() {
        rootView.isHidden = false
        loginView.isHidden = true
    }
}

// MARK: - UITextFieldDelegate

extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case rootView.emailTextField:
            rootView.passwordTextField.becomeFirstResponder()
        case rootView.passwordTextField:
            rootView.passwordTextField.resignFirstResponder()
            rootView.logInButton.sendActions(for: .touchUpInside)
        default:
            break
        }
        
        return true
    }
}




