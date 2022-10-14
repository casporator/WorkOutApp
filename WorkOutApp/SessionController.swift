//
//  SessionsController.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 02.10.2022.
//

import Foundation

import UIKit

class SessionController: BaseController {
    
    private let timerView: BaseInfoView = {
        let view = BaseInfoView(with: "test", alignment: .center)
        
        
        return view
    }()
}
extension SessionController {
    
    override func setupViews() {
        super.setupViews()
        
        view.addView(timerView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    
    override func configureAppearence() {
        super.configureAppearence()
        
        title = "Интенсивность нагрузок"
        //для того, что бы тайтл не переносился в название кнопки таббара:
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.session
        
        addNavBarButton(at: .left, with: Resourses.Strings.NavBar.navBarLeftButton)
        addNavBarButton(at: .right, with: Resourses.Strings.NavBar.navBarRightButton)
        
    }
}
 

