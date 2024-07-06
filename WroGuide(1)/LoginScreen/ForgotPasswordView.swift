//
//  ForgotPasswordView.swift
//  WroGuide(1)
//
//  Created by АХМЕДОВ НИКОЛАЙ on 25/06/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import UIKit

class ForgotPasswordView: UIView {

    let greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Forgot Password"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your email account to reset your password"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.leftViewMode = .always
        textField.leftView = UIImageView(image: UIImage(systemName: "envelope"))
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.leftViewMode = .always
        textField.leftView = UIImageView(image: UIImage(systemName: "phone"))
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = .orange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        addSubview(greetingLabel)
        addSubview(descriptionLabel)
        addSubview(emailTextField)
        addSubview(phoneNumberTextField)
        addSubview(continueButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            greetingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 10),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            phoneNumberTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            phoneNumberTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: 50),
            
            continueButton.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 20),
            continueButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            continueButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            continueButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
