//
//  FilterViewController.swift
//  WroGuide(1)
//
//  Created by АХМЕДОВ НИКОЛАЙ on 05/07/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    private var selectedDuration: String = "Select Duration"
    private var selectedRating: String = "Select Rating"
    
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
        titleLabel.text = "Filter"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let headerStackView = UIStackView(arrangedSubviews: [backButton, titleLabel])
        headerStackView.axis = .horizontal
        headerStackView.alignment = .center
        headerStackView.spacing = 280
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
        
        let tagsCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.backgroundColor = .white
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(TagCell.self, forCellWithReuseIdentifier: "TagCell")
            return collectionView
        }()
        
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
        
        let durationButton = UIButton(type: .system)
        durationButton.setTitle(selectedDuration, for: .normal)
        durationButton.addTarget(self, action: #selector(durationButtonTapped), for: .touchUpInside)
        durationButton.translatesAutoresizingMaskIntoConstraints = false
        
        let ratingsLabel = UILabel()
        ratingsLabel.text = "Ratings"
        ratingsLabel.font = UIFont.systemFont(ofSize: 18)
        ratingsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let ratingsButton = UIButton(type: .system)
        ratingsButton.setTitle(selectedRating, for: .normal)
        ratingsButton.addTarget(self, action: #selector(ratingsButtonTapped), for: .touchUpInside)
        ratingsButton.translatesAutoresizingMaskIntoConstraints = false
        
        let applyButton = UIButton(type: .system)
        applyButton.setTitle("Apply Filter", for: .normal)
        applyButton.backgroundColor = .orange
        applyButton.setTitleColor(.white, for: .normal)
        applyButton.layer.cornerRadius = 10
        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)
        applyButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(headerStackView)
        view.addSubview(categoriesHeaderStackView)
        view.addSubview(tagsCollectionView)
        view.addSubview(priceRangeLabel)
        view.addSubview(priceRangeSlider)
        view.addSubview(minPriceLabel)
        view.addSubview(maxPriceLabel)
        view.addSubview(locationLabel)
        view.addSubview(locationTextField)
        view.addSubview(durationLabel)
        view.addSubview(durationButton)
        view.addSubview(ratingsLabel)
        view.addSubview(ratingsButton)
        view.addSubview(applyButton)
        
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            categoriesHeaderStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 20),
            categoriesHeaderStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            categoriesHeaderStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            tagsCollectionView.topAnchor.constraint(equalTo: categoriesHeaderStackView.bottomAnchor, constant: 20),
            tagsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tagsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tagsCollectionView.heightAnchor.constraint(equalToConstant: 120), // Adjust the height based on content
            
            priceRangeLabel.topAnchor.constraint(equalTo: tagsCollectionView.bottomAnchor, constant: 40),
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
            
            durationButton.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: 10),
            durationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            durationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            ratingsLabel.topAnchor.constraint(equalTo: durationButton.bottomAnchor, constant: 20),
            ratingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ratingsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            ratingsButton.topAnchor.constraint(equalTo: ratingsLabel.bottomAnchor, constant: 10),
            ratingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ratingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            applyButton.topAnchor.constraint(equalTo: ratingsButton.bottomAnchor, constant: 100),
            applyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            applyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            applyButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func seeAllButtonTapped() {
        print("See All button tapped")
    }

    @objc private func applyButtonTapped() {
        print("Apply Filter button tapped")
    }

    @objc private func durationButtonTapped() {
        let durationOptions = ["1 Day", "2 Days", "3 Days", "4 Days", "1 Week"]
        showDropdownMenu(title: "Select Duration", options: durationOptions) { selectedOption in
            self.selectedDuration = selectedOption
            self.view.subviews.compactMap { $0 as? UIButton }.first(where: { $0.currentTitle == self.selectedDuration })?.setTitle(self.selectedDuration, for: .normal)
        }
    }

    @objc private func ratingsButtonTapped() {
        let ratingsOptions = ["1 Star", "2 Stars", "3 Stars", "4 Stars", "5 Stars"]
        showDropdownMenu(title: "Select Rating", options: ratingsOptions) { selectedOption in
            self.selectedRating = selectedOption
            self.view.subviews.compactMap { $0 as? UIButton }.first(where: { $0.currentTitle == self.selectedRating })?.setTitle(self.selectedRating, for: .normal)
        }
    }
    
    private func showDropdownMenu(title: String, options: [String], selectionHandler: @escaping (String) -> Void) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        for option in options {
            let action = UIAlertAction(title: option, style: .default) { _ in
                selectionHandler(option)
            }
            alertController.addAction(action)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension FilterViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCell
        cell.configure(with: tags[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = tags[indexPath.item]
        label.sizeToFit()
        return CGSize(width: label.frame.width + 20, height: 30)
    }
}

class TagCell: UICollectionViewCell {
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(tagLabel)
        contentView.backgroundColor = .systemBlue
        contentView.layer.cornerRadius = 15
        NSLayoutConstraint.activate([
            tagLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            tagLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with tag: String) {
        tagLabel.text = tag
    }
}

private let tags = ["All", "Mountains", "Lake", "Camping", "Rafting", "Hiking", "Scenery", "Beach", "Jungle Safari", "Boating"]
