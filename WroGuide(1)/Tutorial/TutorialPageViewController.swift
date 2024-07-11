//
//  TutorialPageViewController.swift
//  WroGuide(1)
//
//  Created by АХМЕДОВ НИКОЛАЙ on 16/06/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIViewController {
    
    // Properties
    let pageTitle: String
    let pageDescription: String
    let image: UIImage
    var nextButtonAction: (() -> Void)?
    
    // UI элементы
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        return stackView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .orange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Инициализатор для передачи заголовка страницы
    init(pageTitle: String, pageDescription: String, image: UIImage) {
        self.pageTitle = pageTitle
        self.pageDescription = pageDescription
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Добавление stackView на экран
        view.addSubview(stackView)
        
        // Добавление элементов в stackView
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(nextButton)
        
        // Настройка layout constraints для stackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
        
        // Настройка layout constraints для imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // Настройка layout constraints для nextButton
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 100),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Установка текста и изображений
        titleLabel.text = pageTitle
        descriptionLabel.text = pageDescription
        imageView.image = image
        
        // Установка действия для nextButton
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    @objc private func nextButtonTapped() {
        nextButtonAction?()
    }
}
