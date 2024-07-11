//
//  ForgotPasswordViewController.swift
//  WroGuide(1)
//
//  Created by АХМЕДОВ НИКОЛАЙ on 29/06/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    private let instructionLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your email to reset your password:"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let resetPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset Password", for: .normal)
        button.backgroundColor = .orange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupView()
        setupConstraints()
        
        resetPasswordButton.addTarget(self, action: #selector(resetPasswordButtonTapped), for: .touchUpInside)
    }
    
    private func setupView() {
        view.addSubview(instructionLabel)
        view.addSubview(emailTextField)
        view.addSubview(resetPasswordButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            instructionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            instructionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            instructionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            resetPasswordButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            resetPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            resetPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            resetPasswordButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func resetPasswordButtonTapped() {
        let email = emailTextField.text ?? ""
        
        guard !email.isEmpty else {
            let alert = UIAlertController(title: "Error", message: "Email field cannot be empty.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        // Here, you can handle the password reset logic
        let alert = UIAlertController(title: "Success", message: "Password reset link has been sent to your email.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
