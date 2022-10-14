//
//  OverViewController.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 03.10.2022.
//

import Foundation
import UIKit

class OverviewController: BaseController {
    
    private let navBar = OverviewNavBar()
  }

extension OverviewController {
    
    override func setupViews() {
        super.setupViews()
        
        view.addView(navBar)
       
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
    
    override func configureAppearence() {
        super.configureAppearence()
        
     navigationController?.navigationBar.isHidden = true
        
        
    }
}
