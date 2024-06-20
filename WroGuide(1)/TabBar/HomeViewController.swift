//
//  HomeViewController.swift
//  WroGuide(1)
//
//  Created by АХМЕДОВ НИКОЛАЙ on 16/06/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        // Создание надписи
        let label = UILabel()
        label.text = "Where is your next destination?"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false

        // Создание кнопок
        let flightsButton = UIButton(type: .system)
        flightsButton.setTitle("Flights", for: .normal)
        flightsButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        flightsButton.backgroundColor = .systemBlue
        flightsButton.setTitleColor(.white, for: .normal)
        flightsButton.layer.cornerRadius = 10
        flightsButton.translatesAutoresizingMaskIntoConstraints = false
        flightsButton.addTarget(self, action: #selector(flightsButtonTapped), for: .touchUpInside)

        let hotelsButton = UIButton(type: .system)
        hotelsButton.setTitle("Hotels", for: .normal)
        hotelsButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        hotelsButton.backgroundColor = .systemBlue
        hotelsButton.setTitleColor(.white, for: .normal)
        hotelsButton.layer.cornerRadius = 10
        hotelsButton.translatesAutoresizingMaskIntoConstraints = false
        hotelsButton.addTarget(self, action: #selector(hotelsButtonTapped), for: .touchUpInside)

        // Добавление надписи и кнопок на view
        view.addSubview(label)
        view.addSubview(flightsButton)
        view.addSubview(hotelsButton)

        // Настройка автолейаута
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            flightsButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40),
            flightsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flightsButton.widthAnchor.constraint(equalToConstant: 200),
            flightsButton.heightAnchor.constraint(equalToConstant: 50),

            hotelsButton.topAnchor.constraint(equalTo: flightsButton.bottomAnchor, constant: 20),
            hotelsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hotelsButton.widthAnchor.constraint(equalToConstant: 200),
            hotelsButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc private func flightsButtonTapped() {
        let alert = UIAlertController(title: "Flights", message: "Flights button tapped", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    @objc private func hotelsButtonTapped() {
        let alert = UIAlertController(title: "Hotels", message: "Hotels button tapped", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

