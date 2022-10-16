//
//  OverViewNavBar.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 08.10.2022.
//

import Foundation
import UIKit

final class OverviewNavBar: BaseView {
   
    private let titleLable: UILabel = {
        let label = UILabel()
        label.text = Resourses.Strings.OverView.titleWord
        label.textColor = Resourses.Colors.darkGray
        label.font = Resourses.Fonts.helvelticaRegular(witht: 22)
        
        return label
    }()
    
    private let allWorkoutButton: WAButton = {
        let button = WAButton(with: .secondry)
        button.setTitle(Resourses.Strings.OverView.allWorksoutButton)
        return button
    }()
    
    
    private let addButton:  UIButton = {
        let button = UIButton()
        button.setImage(Resourses.Images.Commons.add, for: .normal)
        
        return button
    }()
    
  private let weekView = WeekView()
     
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorder(with: Resourses.Colors.seporator, with: 1)
    }
    
    func addAllWorkoutsAction(_ action: Selector, with target: Any?) {
         allWorkoutButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func addAddingAction(_ action: Selector, with target: Any?) {
         addButton.addTarget(target, action: action, for: .touchUpInside)
    }
}

extension OverviewNavBar {
    override func setupViews() {
        super.setupViews()
        
        addView(allWorkoutButton)
        addView(addButton)
        addView(titleLable)
        addView(weekView)
        
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWorkoutButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkoutButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWorkoutButton.heightAnchor.constraint(equalToConstant: 28),
            
            titleLable.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            titleLable.trailingAnchor.constraint(equalTo: allWorkoutButton.leadingAnchor),
            titleLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weekView.heightAnchor.constraint(equalToConstant: 47)
            
            
        ])
    }
    
    override func configureAppearence() {
        super.configureAppearence()
        backgroundColor = .white
       
    }
}
