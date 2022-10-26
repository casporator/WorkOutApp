//
//  SessionsController.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 02.10.2022.
//

import Foundation

import UIKit

class SessionController: BaseController {
    
    private let timerView = TimerView()
    private let timerDuration = 20.0
    
    override func navBarRightButtonHandler() {
        timerView.stopTimre()
        timerView.state = .isStopped
        
        setTitleForNavBarButton(Resourses.Strings.NavBar.navBarStart, at: .left)
    }
    
    override func navBarLeftButtonHandler() {
        if timerView.state == .isStopped {
        timerView.startTimer()
    } else {
        timerView.pauseTimer()
    }
        timerView.state = timerView.state ==  .isRuning ? .isStopped : .isRuning
      
        setTitleForNavBarButton(
            timerView.state ==  .isRuning ? Resourses.Strings.NavBar.navBarPause : Resourses.Strings.NavBar.navBarStart,
            at: .left)
 }
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
        ])
    }
    
    
    override func configureAppearence() {
        super.configureAppearence()
        
        title = "Интенсивность нагрузок"
        //для того, что бы тайтл не переносился в название кнопки таббара:
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.session
        
        addNavBarButton(at: .left, with: Resourses.Strings.NavBar.navBarStart)
        addNavBarButton(at: .right, with: Resourses.Strings.NavBar.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0.0)
    }
}
 

