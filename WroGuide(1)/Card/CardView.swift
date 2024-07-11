//
//  CardView.swift
//  WroGuide(1)
//
//  Created by АХМЕДОВ НИКОЛАЙ on 03/07/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import UIKit

class CardView: UIView {

    init(image: UIImage, title: String, location: String, price: String, rating: Double) {
        super.init(frame: .zero)
        setupView(image: image, title: title, location: location, price: price, rating: rating)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView(image: UIImage, title: String, location: String, price: String, rating: Double) {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.masksToBounds = true

        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let locationLabel = UILabel()
        locationLabel.text = location
        locationLabel.font = UIFont.systemFont(ofSize: 14)
        locationLabel.textColor = .white
        locationLabel.translatesAutoresizingMaskIntoConstraints = false

        let priceLabel = UILabel()
        priceLabel.text = price
        priceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        priceLabel.textColor = .white
        priceLabel.translatesAutoresizingMaskIntoConstraints = false

        let ratingLabel = UILabel()
        ratingLabel.text = "\(rating)"
        ratingLabel.font = UIFont.systemFont(ofSize: 14)
        ratingLabel.textColor = .white
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false

        let starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
        starImageView.tintColor = .systemYellow
        starImageView.translatesAutoresizingMaskIntoConstraints = false

        let favoriteButton = UIButton(type: .system)
        favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favoriteButton.tintColor = .systemRed
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(locationLabel)
        self.addSubview(priceLabel)
        self.addSubview(ratingLabel)
        self.addSubview(starImageView)
        self.addSubview(favoriteButton)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6),

            favoriteButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10),
            favoriteButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10),

            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),

            locationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            locationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            locationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),

            priceLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),

            starImageView.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            starImageView.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 5),

            ratingLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 5)
        ])
    }
}

