//
//  NotificationViewController.swift
//  WroGuide(1)
//
//  Created by АХМЕДОВ НИКОЛАЙ on 11/07/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        let backButton: UIButton = {
            let button = UIButton(type: .system)
            let chevronImage = UIImage(systemName: "chevron.left")
            button.setImage(chevronImage, for: .normal)
            button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        let titleLabel = UILabel()
        titleLabel.text = "Ring Details"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        
                NSLayoutConstraint.activate([
                    backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                    backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    
                    titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
                ])
            }
            
            @objc private func backButtonTapped() {
                dismiss(animated: true, completion: nil)
            }
}
