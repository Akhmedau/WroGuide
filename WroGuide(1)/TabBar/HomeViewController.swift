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
        self.title = "Home"

        // Создание надписи
        let label = UILabel()
        label.text = "Where Do You\nWant To Discover"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false

        // Создание круглой кнопки с "колоколом"
        let bellButton = UIButton(type: .system)
        bellButton.setImage(UIImage(systemName: "bell"), for: .normal)
        bellButton.tintColor = .black
        bellButton.layer.cornerRadius = 25
        bellButton.translatesAutoresizingMaskIntoConstraints = false
        bellButton.addTarget(self, action: #selector(bellButtonTapped), for: .touchUpInside)

        // Создание поля поиска
        let searchTextField = UITextField()
        searchTextField.placeholder = "Search"
        searchTextField.borderStyle = .roundedRect
        searchTextField.translatesAutoresizingMaskIntoConstraints = false

        // Создание круглой кнопки со значком "фильтра"
        let filterButton = UIButton(type: .system)
        filterButton.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        filterButton.tintColor = .black
        filterButton.layer.cornerRadius = 25
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)

        // Создание прокручиваемого поля с тегами
        let tagsScrollView = UIScrollView()
        tagsScrollView.showsHorizontalScrollIndicator = false
        tagsScrollView.translatesAutoresizingMaskIntoConstraints = false

        let tagsContainerView = UIView()
        tagsContainerView.translatesAutoresizingMaskIntoConstraints = false
        tagsScrollView.addSubview(tagsContainerView)
        
        // Создание прокручиваемого поля для карточек
        let cardsScrollView = UIScrollView()
        cardsScrollView.showsHorizontalScrollIndicator = false
        cardsScrollView.translatesAutoresizingMaskIntoConstraints = false

        let cardsContainerView = UIStackView()
        cardsContainerView.axis = .horizontal
        cardsContainerView.spacing = 5
        cardsContainerView.translatesAutoresizingMaskIntoConstraints = false
        cardsScrollView.addSubview(cardsContainerView)

        let tags = ["Popular", "Featured", "Most Visited", "Nearby", "Asia", "Europe", "America"]
        var previousTag: UIButton?
        for tag in tags {
            let tagButton = UIButton(type: .system)
            tagButton.setTitle(tag, for: .normal)
            tagButton.backgroundColor = .systemGray5
            tagButton.setTitleColor(.black, for: .normal)
            tagButton.layer.cornerRadius = 10
            tagButton.translatesAutoresizingMaskIntoConstraints = false
            tagsContainerView.addSubview(tagButton)
            NSLayoutConstraint.activate([
                tagButton.heightAnchor.constraint(equalToConstant: 30)
            ])
            if let previous = previousTag {
                NSLayoutConstraint.activate([
                    tagButton.leadingAnchor.constraint(equalTo: previous.trailingAnchor, constant: 10),
                    tagButton.centerYAnchor.constraint(equalTo: tagsContainerView.centerYAnchor)
                ])
            } else {
                NSLayoutConstraint.activate([
                    tagButton.leadingAnchor.constraint(equalTo: tagsContainerView.leadingAnchor),
                    tagButton.centerYAnchor.constraint(equalTo: tagsContainerView.centerYAnchor)
                ])
            }
            previousTag = tagButton
        }

        if let lastTag = previousTag {
            lastTag.trailingAnchor.constraint(equalTo: tagsContainerView.trailingAnchor).isActive = true
        }

        // Создание карточек
        let card1 = CardView(image: UIImage(named: "sunset.jpg")!, title: "Rara Lake", location: "Mugu District, Nepal", price: "$85/-", rating: 4.5)
        let card2 = CardView(image: UIImage(named: "nature.jpg")!, title: "Fewa Lake", location: "Pokhara, Nepal", price: "$100/-", rating: 4.7)
        
        cardsContainerView.addArrangedSubview(card1)
        cardsContainerView.addArrangedSubview(card2)
        
        // Создание надписи и кнопки "See All"
        let categoriesLabel = UILabel()
        categoriesLabel.text = "Browse by Categories"
        categoriesLabel.font = UIFont.boldSystemFont(ofSize: 18)
        categoriesLabel.translatesAutoresizingMaskIntoConstraints = false

        let seeAllButton = UIButton(type: .system)
        seeAllButton.setTitle("See All", for: .normal)
        seeAllButton.setTitleColor(.systemOrange, for: .normal)
        seeAllButton.translatesAutoresizingMaskIntoConstraints = false
        seeAllButton.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)

        let categoriesScrollView = UIScrollView()
        categoriesScrollView.showsHorizontalScrollIndicator = false
        categoriesScrollView.translatesAutoresizingMaskIntoConstraints = false

        let categoriesContainerView = UIStackView()
        categoriesContainerView.axis = .horizontal
        categoriesContainerView.spacing = 10
        categoriesContainerView.translatesAutoresizingMaskIntoConstraints = false
        categoriesScrollView.addSubview(categoriesContainerView)

        let categories = [
            ("Mountain", UIImage(named: "mountain.jpg")!),
            ("Beach", UIImage(named: "beach.jpg")!),
            ("Jungle Safa", UIImage(named: "jungle.jpg")!),
            ("Camping", UIImage(named: "camping.jpg")!)
        ]
        
        for (title, image) in categories {
            let categoryView = CategoryView(image: image, title: title)
            categoriesContainerView.addArrangedSubview(categoryView)
            NSLayoutConstraint.activate([
                categoryView.widthAnchor.constraint(equalToConstant: 100),
                categoryView.heightAnchor.constraint(equalToConstant: 120)
            ])
        }

        // Добавление надписи и кнопок на view
        view.addSubview(label)
        view.addSubview(bellButton)
        view.addSubview(searchTextField)
        view.addSubview(filterButton)
        view.addSubview(tagsScrollView)
        view.addSubview(cardsScrollView)
        view.addSubview(categoriesLabel)
        view.addSubview(seeAllButton)
        view.addSubview(categoriesScrollView)

        // Настройка автолейаута
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            bellButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            bellButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bellButton.widthAnchor.constraint(equalToConstant: 50),
            bellButton.heightAnchor.constraint(equalToConstant: 50),

            searchTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: filterButton.leadingAnchor, constant: -10),

            filterButton.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            filterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            filterButton.widthAnchor.constraint(equalToConstant: 50),
            filterButton.heightAnchor.constraint(equalToConstant: 50),

            tagsScrollView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            tagsScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tagsScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tagsScrollView.heightAnchor.constraint(equalToConstant: 40),

            tagsContainerView.topAnchor.constraint(equalTo: tagsScrollView.topAnchor),
            tagsContainerView.bottomAnchor.constraint(equalTo: tagsScrollView.bottomAnchor),
            tagsContainerView.leadingAnchor.constraint(equalTo: tagsScrollView.leadingAnchor),
            tagsContainerView.trailingAnchor.constraint(equalTo: tagsScrollView.trailingAnchor),
            tagsContainerView.heightAnchor.constraint(equalTo: tagsScrollView.heightAnchor),

            cardsScrollView.topAnchor.constraint(equalTo: tagsScrollView.bottomAnchor, constant: 20),
            cardsScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardsScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cardsScrollView.heightAnchor.constraint(equalToConstant: 200),

            cardsContainerView.topAnchor.constraint(equalTo: cardsScrollView.topAnchor),
            cardsContainerView.bottomAnchor.constraint(equalTo: cardsScrollView.bottomAnchor),
            cardsContainerView.leadingAnchor.constraint(equalTo: cardsScrollView.leadingAnchor),
            cardsContainerView.trailingAnchor.constraint(equalTo: cardsScrollView.trailingAnchor),
            cardsContainerView.heightAnchor.constraint(equalTo: cardsScrollView.heightAnchor),

            categoriesLabel.topAnchor.constraint(equalTo: cardsScrollView.bottomAnchor, constant: 20),
            categoriesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            seeAllButton.centerYAnchor.constraint(equalTo: categoriesLabel.centerYAnchor),
            seeAllButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            categoriesScrollView.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: 10),
            categoriesScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            categoriesScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            categoriesScrollView.heightAnchor.constraint(equalToConstant: 120),

            categoriesContainerView.topAnchor.constraint(equalTo: categoriesScrollView.topAnchor),
            categoriesContainerView.bottomAnchor.constraint(equalTo: categoriesScrollView.bottomAnchor),
            categoriesContainerView.leadingAnchor.constraint(equalTo: categoriesScrollView.leadingAnchor),
            categoriesContainerView.trailingAnchor.constraint(equalTo: categoriesScrollView.trailingAnchor),
            categoriesContainerView.heightAnchor.constraint(equalTo: categoriesScrollView.heightAnchor)
        ])
    }

    @objc private func bellButtonTapped() {
        let alert = UIAlertController(title: "Bell", message: "Bell button tapped", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

//    @objc private func filterButtonTapped() {
//        let alert = UIAlertController(title: "Filter", message: "Filter button tapped", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        present(alert, animated: true, completion: nil)
//    }
    
    @objc private func seeAllButtonTapped() {
        let alert = UIAlertController(title: "See All", message: "See All button tapped", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @objc func filterButtonTapped() {
        let filterVC = FilterViewController()
        filterVC.modalPresentationStyle = .fullScreen
        present(filterVC, animated: true, completion: nil)
    }

}


