//
//  BaseController.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 02.10.2022.
//

import Foundation
import UIKit

enum NavBarButtonPosition {
    case left
    case right
}

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        layoutViews()
        configure()
        
    }
}

@objc extension BaseController {
    func addViews() {}
    func layoutViews() {}
    
    func configure() {
       view.backgroundColor = Resourses.Colors.background
    }
    func navBarLeftButtonHandler() {
        print("NavBar Left Button tapped")
    }

    func navBarRightButtonHandler() {
        print("NavBar Right Button tapped")
    }
}


extension BaseController {
    func addNavBarButton(at position: NavBarButtonPosition, with title: String){
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(Resourses.Colors.active, for: .normal)
        button.setTitleColor(Resourses.Colors.inactive, for: .disabled)
        button.titleLabel?.font = Resourses.Fonts.helvelticaRegular(witht: 17)
        
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}

