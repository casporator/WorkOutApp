//
//  NavBarController.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 02.10.2022.
//

import Foundation
import UIKit

final class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: Resourses.Colors.darkGray, .font: Resourses.Fonts.helvelticaRegular(witht: 17)]
        
        navigationBar.addBottomBorder(with: Resourses.Colors.seporator, with: 1)
        
    }
}
