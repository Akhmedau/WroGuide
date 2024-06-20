//
//  NextViewController.swift
//  WroGuide(1)
//
//  Created by АХМЕДОВ НИКОЛАЙ on 16/06/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import UIKit

class NextViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var pageViewController: UIPageViewController!
    let pageTitles = ["Как бронировать отель", "Покупать билет в самолёт", "Календарь выгодных покупок"]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        // Настройка UIPageViewController
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self

        if let firstViewController = viewControllerAtIndex(0) {
            pageViewController.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }

        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)

        // Настройка автолейаута для UIPageViewController
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        // Добавление кнопки для перехода на HomeViewController
        let goToHomeButton = UIButton(type: .system)
        goToHomeButton.setTitle("Go to Home", for: .normal)
        goToHomeButton.addTarget(self, action: #selector(goToHomeButtonTapped), for: .touchUpInside)
        goToHomeButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(goToHomeButton)

        NSLayoutConstraint.activate([
            goToHomeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goToHomeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

    @objc private func goToHomeButtonTapped() {
        let tabBarController = UITabBarController()

        let homeVC = HomeViewController()
        let searchVC = SearchViewController()
        let calendarVC = CalendarViewController()

        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        calendarVC.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(systemName: "calendar"), tag: 2)

        tabBarController.viewControllers = [homeVC, searchVC, calendarVC]

        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true, completion: nil)
    }

    func viewControllerAtIndex(_ index: Int) -> TutorialPageViewController? {
        if index >= 0 && index < pageTitles.count {
            return TutorialPageViewController(pageTitle: pageTitles[index])
        }
        return nil
    }

    // MARK: - UIPageViewControllerDataSource

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? TutorialPageViewController else { return nil }
        var index = pageTitles.firstIndex(of: viewController.pageTitle)!
        index -= 1
        return viewControllerAtIndex(index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? TutorialPageViewController else { return nil }
        var index = pageTitles.firstIndex(of: viewController.pageTitle)!
        index += 1
        return viewControllerAtIndex(index)
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageTitles.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}




