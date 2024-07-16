//
//  TutorialViewController.swift
//  WroGuide(1)
//
//  Created by АХМЕДОВ НИКОЛАЙ on 28/06/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import UIKit

class TutorialViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    // Инициализация страниц
    lazy var pages: [TutorialPageViewController] = {
        let page1 = TutorialPageViewController(
            pageTitle: "Jobs fill your pocket,",
            pageDescription: "Adventures fill your soul. Travelling is the best way to learn new things. A person travels for both pleasure and knowledge.",
            image: UIImage(named: "1.jpg")!
        )
        let page2 = TutorialPageViewController(
            pageTitle: "Discover new places",
            pageDescription: "Explore unknown territories and make unforgettable memories.",
            image: UIImage(named: "2.jpg")!
        )
        let page3 = TutorialPageViewController(
            pageTitle: "Meet new people",
            pageDescription: "Connect with different cultures and share your experiences.",
            image: UIImage(named: "3.jpg")!
        )
        
        // Установка действий для кнопок "Next"
        page1.nextButtonAction = { [weak self] in
            self?.setViewControllers([page2], direction: .forward, animated: true, completion: nil)
        }
        
        page2.nextButtonAction = { [weak self] in
            self?.setViewControllers([page3], direction: .forward, animated: true, completion: nil)
        }
        
        page3.nextButtonAction = { [weak self] in
            // Handle action for the last page, like dismissing the tutorial
        }
        
        return [page1, page2, page3]
    }()
    
    // Индикатор страниц
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .orange
        pageControl.pageIndicatorTintColor = .lightGray
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        // Установка первой страницы
        setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
        
        // Настройка pageControl
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        view.addSubview(pageControl)
        
        // Layout для pageControl
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Добавление кнопки Skip
        let skipButton = UIButton(type: .system)
        let chevronImage = UIImage(systemName: "chevron.right")
        skipButton.setImage(chevronImage, for: .normal)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        view.addSubview(skipButton)
        
        // Layout для skipButton
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    // DataSource методы
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController as! TutorialPageViewController), index > 0 else {
            return nil
        }
        return pages[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController as! TutorialPageViewController), index < pages.count - 1 else {
            return nil
        }
        return pages[index + 1]
    }
    
    // Delegate метод для обновления индикатора страниц
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let currentViewController = viewControllers?.first, let index = pages.firstIndex(of: currentViewController as! TutorialPageViewController) {
            pageControl.currentPage = index
        }
    }
    
    @objc private func skipButtonTapped() {
        let homeViewController = HomeViewController()
        homeViewController.modalPresentationStyle = .fullScreen
        present(homeViewController, animated: true, completion: nil)
    }
}


