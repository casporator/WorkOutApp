//
//  SessionsController.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 02.10.2022.
//

import Foundation

import UIKit

class SessionController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Интенсивность нагрузок"
        //для того, что бы тайтл не переносился в название кнопки таббара:
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.session
        
        addNavBarButton(at: .left, with: Resourses.Strings.NavBar.navBarLeftButton)
        addNavBarButton(at: .right, with: Resourses.Strings.NavBar.navBarRightButton)
        
    }
}
