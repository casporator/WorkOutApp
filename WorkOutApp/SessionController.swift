//
//  SessionsController.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 02.10.2022.
//

import Foundation

import UIKit

class SessionController: BaseController {
    
    private let statsView = StatsView(with: Resourses.Strings.progressView.workoutStats.uppercased())
    
    private let stepsView = StepsView(with: Resourses.Strings.progressView.stepsCounter.uppercased())
    
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
        view.addView(statsView)
        view.addView(stepsView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),

            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),

            stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
            stepsView.topAnchor.constraint(equalTo: statsView.topAnchor),
            stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stepsView.heightAnchor.constraint(equalTo: statsView.heightAnchor),
            
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
      /*
        timerView.callBack = { [weak self] in
            self?.navBarRightButtonHandler()
        }
     */
        statsView.configure(with: [.heartRate(value: "155"),
                                   .averagePace(value: "8'20''"),
                                   .totalSteps(value: "7,682"),
                                   .totalDistance(value: "8.25")
                                   ])
        
        stepsView.configure(with: [.init(value: "8k", heightMultiplire: 1.0, title: "2/13"),
                                   .init(value: "7k", heightMultiplire: 0.8, title: "2/14"),
                                   .init(value: "5k", heightMultiplire: 0.5, title: "2/15"),
                                   .init(value: "6k", heightMultiplire: 0.7, title: "2/16"),
                                  ])
    }
}
 

                          
