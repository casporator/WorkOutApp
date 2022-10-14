//
//  WeekDayView.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 08.10.2022.
//

import Foundation
import UIKit

extension WeekView {
   final class WeekDayView: BaseView {
    
       private let nameLabel = UILabel()
       private let dateLabel = UILabel()
       private let stackView = UIStackView()
       
       func configure(with index: Int, and name: String) {
           let startOfDWeek = Date().startOfWeek
           let currentDate = startOfDWeek.goForwordDate(to: index)
           let day = Calendar.current.component(.day, from: currentDate)
           
           let isTooday = currentDate.stripTime() == Date().stripTime()
           backgroundColor = isTooday ? Resourses.Colors.active : Resourses.Colors.background
           
           nameLabel.text = name.uppercased() //все заглавные буквы
           nameLabel.textColor = isTooday ? .white : Resourses.Colors.inactive
           
           dateLabel.text = "\(day)"
           dateLabel.textColor = isTooday ? .white : Resourses.Colors.inactive
       }
    
  }
}

extension WeekView.WeekDayView {
    
    override func setupViews() {
        super.setupViews()
        addView(stackView)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
         ])
    }
    
    override func configureAppearence() {
        super.configureAppearence()
        
        
        
        backgroundColor = .systemGray4
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        nameLabel.font = Resourses.Fonts.helvelticaRegular(witht: 9)
        nameLabel.textAlignment = .center
        
        dateLabel.font = Resourses.Fonts.helvelticaRegular(witht: 15)
        dateLabel.textAlignment = .center
        
        stackView.spacing = 3
        stackView.axis = .vertical
    }
}
