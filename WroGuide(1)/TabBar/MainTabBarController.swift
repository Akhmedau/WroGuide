//
//  MainTabBarController.swift
//  WroGuide(1)
//
//  Created by АХМЕДОВ НИКОЛАЙ on 02/07/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Инициализация контроллеров
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let calendarVC = UINavigationController(rootViewController: CalendarViewController())
        
        // Настройка табов
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        calendarVC.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(systemName: "calendar"), tag: 2)
        
        // Установка контроллеров
        self.viewControllers = [homeVC, searchVC, calendarVC]
        
        // Настройка скрытия таббара при прокрутке
        self.hidesBottomBarWhenPushed = true
    }
}

