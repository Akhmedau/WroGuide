//
//  FilterViewController.swift
//  WroGuide(1)
//
//  Created by АХМЕДОВ НИКОЛАЙ on 05/07/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        let backButton = UIButton(type: .system)
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = "Filter"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let headerStackView = UIStackView(arrangedSubviews: [backButton, titleLabel])
        headerStackView.axis = .horizontal
        headerStackView.alignment = .center
        headerStackView.spacing = 20
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let categoriesLabel = UILabel()
        categoriesLabel.text = "Categories"
        categoriesLabel.font = UIFont.systemFont(ofSize: 18)
        categoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let seeAllButton = UIButton(type: .system)
        seeAllButton.setTitle("See All", for: .normal)
        seeAllButton.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
        seeAllButton.translatesAutoresizingMaskIntoConstraints = false
        
        let categoriesHeaderStackView = UIStackView(arrangedSubviews: [categoriesLabel, UIView(), seeAllButton])
        categoriesHeaderStackView.axis = .horizontal
        categoriesHeaderStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let tagsStackView = UIStackView()
        tagsStackView.axis = .horizontal
        tagsStackView.spacing = 10
        tagsStackView.distribution = .fillProportionally
        tagsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let tags = ["All", "Mountains", "Lake", "Camping", "Rafting", "Hiking", "Scenery", "Beach", "Jungle Safari", "Boating"]
        for tag in tags {
            let tagButton = UIButton(type: .system)
            tagButton.setTitle(tag, for: .normal)
            tagButton.layer.borderWidth = 1
            tagButton.layer.borderColor = UIColor.lightGray.cgColor
            tagButton.layer.cornerRadius = 15
            tagButton.translatesAutoresizingMaskIntoConstraints = false
            tagsStackView.addArrangedSubview(tagButton)
        }
        
        let priceRangeLabel = UILabel()
        priceRangeLabel.text = "Price Range"
        priceRangeLabel.font = UIFont.systemFont(ofSize: 18)
        priceRangeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let priceRangeSlider = UISlider()
        priceRangeSlider.translatesAutoresizingMaskIntoConstraints = false
        
        let minPriceLabel = UILabel()
        minPriceLabel.text = "$75"
        minPriceLabel.font = UIFont.systemFont(ofSize: 16)
        minPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let maxPriceLabel = UILabel()
        maxPriceLabel.text = "$255"
        maxPriceLabel.font = UIFont.systemFont(ofSize: 16)
        maxPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let locationLabel = UILabel()
        locationLabel.text = "Location"
        locationLabel.font = UIFont.systemFont(ofSize: 18)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let locationTextField = UITextField()
        locationTextField.placeholder = "Search Places"
        locationTextField.borderStyle = .roundedRect
        locationTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let durationLabel = UILabel()
        durationLabel.text = "Duration"
        durationLabel.font = UIFont.systemFont(ofSize: 18)
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let durationPicker = UIPickerView()
        durationPicker.translatesAutoresizingMaskIntoConstraints = false
        
        let ratingsLabel = UILabel()
        ratingsLabel.text = "Ratings"
        ratingsLabel.font = UIFont.systemFont(ofSize: 18)
        ratingsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let ratingsPicker = UIPickerView()
        ratingsPicker.translatesAutoresizingMaskIntoConstraints = false
        
        let applyButton = UIButton(type: .system)
        applyButton.setTitle("Apply Filter", for: .normal)
        applyButton.backgroundColor = .orange
        applyButton.setTitleColor(.white, for: .normal)
        applyButton.layer.cornerRadius = 10
        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)
        applyButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(headerStackView)
        view.addSubview(categoriesHeaderStackView)
        view.addSubview(tagsStackView)
        view.addSubview(priceRangeLabel)
        view.addSubview(priceRangeSlider)
        view.addSubview(minPriceLabel)
        view.addSubview(maxPriceLabel)
        view.addSubview(locationLabel)
        view.addSubview(locationTextField)
        view.addSubview(durationLabel)
        view.addSubview(durationPicker)
        view.addSubview(ratingsLabel)
        view.addSubview(ratingsPicker)
        view.addSubview(applyButton)
        
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            categoriesHeaderStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 20),
            categoriesHeaderStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            categoriesHeaderStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            tagsStackView.topAnchor.constraint(equalTo: categoriesHeaderStackView.bottomAnchor, constant: 20),
            tagsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tagsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            priceRangeLabel.topAnchor.constraint(equalTo: tagsStackView.bottomAnchor, constant: 20),
            priceRangeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            priceRangeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            priceRangeSlider.topAnchor.constraint(equalTo: priceRangeLabel.bottomAnchor, constant: 20),
            priceRangeSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            priceRangeSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            minPriceLabel.topAnchor.constraint(equalTo: priceRangeSlider.bottomAnchor, constant: 10),
            minPriceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            maxPriceLabel.topAnchor.constraint(equalTo: priceRangeSlider.bottomAnchor, constant: 10),
            maxPriceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            locationLabel.topAnchor.constraint(equalTo: minPriceLabel.bottomAnchor, constant: 20),
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            locationTextField.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            locationTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            locationTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            durationLabel.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 20),
            durationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            durationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            durationPicker.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: 10),
            durationPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            durationPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            ratingsLabel.topAnchor.constraint(equalTo: durationPicker.bottomAnchor, constant: 20),
            ratingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ratingsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            ratingsPicker.topAnchor.constraint(equalTo: ratingsLabel.bottomAnchor, constant: 10),
            ratingsPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ratingsPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            applyButton.topAnchor.constraint(equalTo: ratingsPicker.bottomAnchor, constant: 20),
            applyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            applyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            applyButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc private func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

    @objc private func seeAllButtonTapped() {
        print("See All button tapped")
    }

    @objc private func applyButtonTapped() {
        print("Apply Filter button tapped")
    }
}

