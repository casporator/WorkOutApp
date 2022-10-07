//
//  OverViewController.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 03.10.2022.
//

import Foundation
import UIKit

class OverviewController: BaseController {
    
    private let allWorkoutButton = SecondaryButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Обзор"
  }
}

extension OverviewController {
    
    override func addViews() {
        super.addViews()
        
        view.addSubview(allWorkoutButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            allWorkoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            allWorkoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            allWorkoutButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutButton.widthAnchor.constraint(equalToConstant: 130)
        
        ])
    }
    
    override func configure() {
        super.configure()
        
        allWorkoutButton.toAutoLayout()
        allWorkoutButton.setTitle(Resourses.Strings.OverView.allWorksoutButton)
        allWorkoutButton.addTarget(self,
                                   action: #selector(allWorkoutButtonAction),
                                   for: .touchUpInside)
    }
}

@objc extension OverviewController {
    
    func allWorkoutButtonAction(){
        print("All Worksout Button tapped")
    }
}
