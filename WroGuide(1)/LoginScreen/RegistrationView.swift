//
//  RegistrationView.swift
//  WroGuide(1)
//
//  Created by АХМЕДОВ НИКОЛАЙ on 16/06/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import UIKit

protocol RegistrationViewDelegate: AnyObject {
    func didTapSignInLabel()
}

class RegistrationView: UIView {
    
    weak var delegate: RegistrationViewDelegate?
    
    let labelOne: UILabel = {
        let label = UILabel()
        label.text = "Let's Get Started"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelTwo: UILabel = {
        let label = UILabel()
        label.text = "Please fill the details and create account"
        label.font = UIFont.systemFont(ofSize: 10.0, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "User Name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let oAuthLabel: UILabel = {
        let oAuthLabel = UILabel()
        oAuthLabel.text = "Or Use Instant Sign Up"
        oAuthLabel.numberOfLines = 2
        oAuthLabel.font = UIFont.systemFont(ofSize: 10.0, weight: .light)
        oAuthLabel.translatesAutoresizingMaskIntoConstraints = false
        return oAuthLabel
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let googleButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let appleButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let facebookButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let labelThree: UILabel = {
        let labelThree = UILabel()
        labelThree.text = "Already have an account? Sign In"
        labelThree.textColor = UIColor.systemOrange
        labelThree.numberOfLines = 2
        labelThree.font = UIFont.systemFont(ofSize: 10.0, weight: .light)
        labelThree.translatesAutoresizingMaskIntoConstraints = false
        return labelThree
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
        backgroundColor = .white
        
        // Apply gradient background
        UIColor.applyGradientLayer(view: self)
        
        addSubview(labelOne)
        addSubview(labelTwo)
        addSubview(userNameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(logInButton)
        addSubview(skipButton)
        addSubview(oAuthLabel)
        addSubview(statusLabel)
        addSubview(labelThree)
        addSubview(googleButton)
        addSubview(appleButton)
        addSubview(facebookButton)
        
        googleButton.setIcon(UIImage(named: "google_icon"))
        appleButton.setIcon(UIImage(named: "apple_icon"))
        facebookButton.setIcon(UIImage(named: "facebook_icon"))
        
        // Add tap gesture recognizer to labelThree
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapSignInLabel))
        labelThree.isUserInteractionEnabled = true
        labelThree.addGestureRecognizer(tapGesture)
    }
    
    @objc private func didTapSignInLabel() {
        delegate?.didTapSignInLabel()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            skipButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            skipButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),

            labelOne.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelOne.topAnchor.constraint(equalTo: skipButton.bottomAnchor, constant: 20),
            
            labelTwo.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelTwo.topAnchor.constraint(equalTo: labelOne.bottomAnchor, constant: 20),
            
            userNameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            userNameTextField.topAnchor.constraint(equalTo: labelTwo.bottomAnchor, constant: 10),
            userNameTextField.widthAnchor.constraint(equalToConstant: 200),

            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 10),
            emailTextField.widthAnchor.constraint(equalToConstant: 200),

            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.widthAnchor.constraint(equalToConstant: 200),

            logInButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            
            oAuthLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            oAuthLabel.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 20),

            statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            statusLabel.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 20),

            googleButton.widthAnchor.constraint(equalToConstant: 50),
            googleButton.heightAnchor.constraint(equalTo: googleButton.widthAnchor),
            googleButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -70),
            googleButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
            
            appleButton.widthAnchor.constraint(equalToConstant: 50),
            appleButton.heightAnchor.constraint(equalTo: appleButton.widthAnchor),
            appleButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            appleButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
            
            facebookButton.widthAnchor.constraint(equalToConstant: 50),
            facebookButton.heightAnchor.constraint(equalTo: facebookButton.widthAnchor),
            facebookButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 70),
            facebookButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
            
            labelThree.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelThree.topAnchor.constraint(equalTo: appleButton.bottomAnchor, constant: 40),
        ])
    }
}






