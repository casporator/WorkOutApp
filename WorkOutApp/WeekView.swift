//
//  WeekView.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 08.10.2022.
//

import Foundation
import UIKit

final class WeekView: BaseView {
    
    private let calendar = Calendar.current
    
    private let stackView = UIStackView()
}

extension WeekView {
    
    override func addViews() {
        super.addViews()
        addView(stackView)
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configure() {
        super.configure()
        
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        
        var weekdays = calendar.shortStandaloneWeekdaySymbols
        
        //(ВСК идет первым) убираем воскресенье из списка и ставим в конец
        if calendar.firstWeekday == 1 {
            let sunday = weekdays.remove(at: 0)
            weekdays.append(sunday)
        }
      
        
        weekdays.enumerated().forEach { index, name in
            let view = WeekDayView()
            view.configure(with: index, and: name)
            stackView.addArrangedSubview(view)
            
        }
    }
}
