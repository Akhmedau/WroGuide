//
//  CalendarViewController.swift
//  WroGuide(1)
//
//  Created by АХМЕДОВ НИКОЛАЙ on 16/06/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

    var calendar: FSCalendar!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        self.title = "Calendar"

        // Создание и настройка календаря
        calendar = FSCalendar()
        calendar.dataSource = self
        calendar.delegate = self
        calendar.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(calendar)

        // Настройка автолейаута для календаря
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calendar.heightAnchor.constraint(equalToConstant: 300) // Установите нужную высоту
        ])
    }

    // FSCalendarDataSource methods
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        // Здесь можно указать количество событий для определенной даты
        return 0
    }

    // FSCalendarDelegate methods
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let alert = UIAlertController(title: "Selected Date", message: "Вы выбрали дату: \(date)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    // Этот метод можно использовать для отображения событий или скидок
    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        // Пример: показ скидок на определенную дату
        if formatter.string(from: date) == "2024-12-25" {
            return "Скидка 50%"
        }

        return nil
    }
}


