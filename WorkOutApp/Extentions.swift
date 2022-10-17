//
//  Colors.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 02.10.2022.
//

import Foundation
import UIKit

// расширение hex формата для цвета
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension UIView {
    //MARK: добавляю линию под навбаром
    func addBottomBorder(with color: UIColor, with height: CGFloat) {
        let seporator = UIView()
        seporator.backgroundColor = color
        seporator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        seporator.frame = CGRect(x: 0,
                                 y: frame.height - height,
                                 width: frame.width,
                                 height: height)
        addSubview(seporator)
    }
    
//MARK: выношу AutoresizingMask, для того что бы постоянно не писать
    func addView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }

//MARK: делаю моргание кастомной кнопки при нажатии
func makeSystem(_ button: UIButton) {
    button.addTarget(self, action: #selector(handleIn), for: [
        .touchDown,
        .touchDragInside
    ])
    
    button.addTarget(self, action: #selector(handleOut), for: [
        .touchDragOutside,
        .touchUpInside,
        .touchDragExit,
        .touchCancel
    ])
 }

    @objc func handleIn() {
    UIView.animate(withDuration: 0.15) {self.alpha = 0.55}
 }

    @objc func handleOut() {
    UIView.animate(withDuration: 0.15) {self.alpha = 1}
 }
}

//MARK: убрать клавиатуру по тапу
extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension Date {
    static var calendar: Calendar = {
        var calendar = Calendar(identifier: .gregorian)
        calendar.firstWeekday = 2
        return calendar
    }()
    
    var startOfWeek: Date {
        let component = Date.calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
        guard let firstDay = Date.calendar.date(from: component) else { return self }
        
        return Date.calendar.date(byAdding: .day, value: 0, to: firstDay) ?? self
 }
    
    func goForwordDate(to days: Int) -> Date {
        return Date.calendar.date(byAdding: .day, value: days, to: self) ?? self
        }
    
    func stripTime() -> Date {
        let component = Date.calendar.dateComponents([.year,.month, .day], from: self)
        return Date.calendar.date(from: component) ?? self
    }
}
