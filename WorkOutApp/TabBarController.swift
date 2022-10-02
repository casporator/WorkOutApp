//
//  TabBarController.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 02.10.2022.
//

import Foundation
import UIKit

// создаю перечисление всех вкладок таббара
enum Tabs: Int {
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super .init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        tabBar.tintColor = Resourses.Colors.active
        tabBar.barTintColor = Resourses.Colors.inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = Resourses.Colors.seporator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let overviewController = UIViewController()
        let sessionController = UIViewController()
        let progressController = UIViewController()
        let settingsController = UIViewController()
        
        let overviewNavigation = UINavigationController(rootViewController: overviewController)
        let sessionNavigation = UINavigationController(rootViewController: sessionController)
        let progressNavigation = UINavigationController(rootViewController: progressController)
        let settingsNavigation = UINavigationController(rootViewController: settingsController)
        
        overviewNavigation.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.overview,                                                image: Resourses.Images.TabBar.overview,
                                                     tag: Tabs.overview.rawValue)
        sessionNavigation.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.session,                                                 image: Resourses.Images.TabBar.session,
                                                     tag: Tabs.session.rawValue)
        progressNavigation.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.progress,                                                image: Resourses.Images.TabBar.progress,
                                                     tag: Tabs.progress.rawValue)
        settingsNavigation.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.settings,                                                image: Resourses.Images.TabBar.settings,
                                                     tag: Tabs.settings.rawValue)
        
        setViewControllers([overviewNavigation, sessionNavigation, progressNavigation, settingsNavigation], animated: true)
    }
}
