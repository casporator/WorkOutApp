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
        static var active = UIColor(hexString: "#437BFE")
        static var inactive = UIColor(hexString: "#929DA5")
        static var seporator = UIColor(hexString: "#E8ECEF")
        static var darkGray = UIColor(hexString: "#545C77")
        static var background = UIColor(hexString: "#F2F2F2")
    }
    
    enum Strings {
        enum TabBar {
            static var overview = "Обзор"
            static var session = "Сессия"
            static var progress = "Прогресс"
            static var settings = "Настройки"
        }
    }
    
    enum Images {
        enum TabBar {
            static var overview = UIImage(named: "House Icon")
            static var session = UIImage(named:"Clock Icon")
            static var progress = UIImage(named:"Analytics Bars")
            static var settings = UIImage(named:"Gear Icon")
        }
    }
    
    enum Fonts {
        static func helvelticaRegular(witht size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
    
}
