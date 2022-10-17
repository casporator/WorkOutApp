//
//  Resouses.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 02.10.2022.
//

import Foundation
import UIKit


enum Resourses {
    enum Colors{
        static let active = UIColor(hexString: "#437BFE")
        static let inactive = UIColor(hexString: "#929DA5")
        static let seporator = UIColor(hexString: "#E8ECEF")
        static let darkGray = UIColor(hexString: "#545C77")
        static let background = UIColor(hexString: "#F2F2F2")
        static let secondary = UIColor(hexString: "#F0F3FF")
        
    }
    
    enum Strings {
        enum TabBar {
            static let overview = "Обзор"
            static let session = "Сессия"
            static let progress = "Прогресс"
            static let settings = "Настройки"
        }
            enum NavBar {
            static let navBarLeftButton = "Пауза"
            static let navBarRightButton = "Финиш"
        }
        enum OverView {
            static let allWorksoutButton = "Все занятия"
            static let titleWord = "Сегодня"
        }
    }
    enum Images {
        enum TabBar {
            static let overview = UIImage(named: "House Icon")
            static let session = UIImage(named:"Clock Icon")
            static let progress = UIImage(named:"Analytics Bars")
            static let settings = UIImage(named:"Gear Icon")
        }
        
        enum Commons {
            static let downArrow = UIImage(named: "Path")
            static let add = UIImage(named: "Add")
        }
    }
    
    enum Fonts {
        static func helvelticaRegular(witht size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
  }

