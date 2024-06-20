//
//  ViewController.swift
//  WroGuide(1)
//
//  Created by АХМЕДОВ НИКОЛАЙ on 13/06/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import UIKit

class ViewController_MVC : UITabBarController {

    var user: User?

     // UI Elements
     let welcomeLabel: UILabel = {
         let label = UILabel()
         label.text = "WELCOME BACK"
         label.font = UIFont.boldSystemFont(ofSize: 24)
         label.textAlignment = .center
         label.textColor = .systemBlue
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()

     let usernameLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 20)
         label.textAlignment = .center
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()

     let logoutButton: UIButton = {
         let button = UIButton(type: .system)
         button.setTitle("Log Out", for: .normal)
         button.backgroundColor = .red
         button.setTitleColor(.black, for: .normal)
         button.layer.cornerRadius = 10
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()

     override func viewDidLoad() {
         super.viewDidLoad()

         view.backgroundColor = .systemGroupedBackground

         // Apply gradient background
         UIColor.applyGradientLayer(view: view)


         view.addSubview(welcomeLabel)
         view.addSubview(usernameLabel)
         view.addSubview(logoutButton)

         if let username = user?.username {
             usernameLabel.text = username
         }

         // Autolayout constraints
         NSLayoutConstraint.activate([
             welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
             welcomeLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),

             usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             usernameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
             usernameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),

             logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             logoutButton.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 20),
             logoutButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
             logoutButton.heightAnchor.constraint(equalToConstant: 50)
         ])

         logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
     }

     @objc private func logoutButtonTapped(_ sender: UIButton) {
         dismiss(animated: true, completion: nil)
    
    }
}


