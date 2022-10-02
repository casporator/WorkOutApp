//
//  File.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 02.10.2022.
//

import Foundation
import UIKit

class ProgressController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Прогресс тренеровок"
        //для того, что бы тайтл не переносился в название кнопки таббара:
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.progress
        
        addNavBarButton(at: .left, with: "Экспорт")
        addNavBarButton(at: .right, with: "Подробно")
        
    }
}
