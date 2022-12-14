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
            static let navBarStart = "Старт"
            static let navBarPause = "Пауза"
            static let navBarFinish = "Сброс"
        }
        enum OverView {
            static let allWorksoutButton = "Все занятия"
            static let titleWord = "Сегодня"
        }
        
        enum Time {
            static let elapsedTime = "Прошедшее время"
            static let remainingTime = "Оставшееся время"
        }
        
        enum progressView{
            static let workoutStats = "Статистика"
            static let averagePace = "Средний темп"
            static let heartRate = "Сердечный ритм"
            static let totalDistance = "Общее расстояние"
            static let stepsCounter = "Счётчик шагов"
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
        
        enum Stats {
            static let heart = UIImage(named: "Heart Beat Icon")
            static let speed = UIImage(named: "Speed Icon")
            static let maps = UIImage(named: "Maps Icon")
            static let steps = UIImage(named: "Steps Icon")
        }
    }
    
    enum Fonts {
        static func helvelticaRegular(witht size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
            static func boldSystemFont(with size: CGFloat) -> UIFont {
                UIFont(name: "oldSystemFont", size: size) ?? UIFont()
            }
        }
    }
  

