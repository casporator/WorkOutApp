//
//  SecondaryButton.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 07.10.2022.
//

import Foundation
import UIKit

// перечисление 2ух вариантов исполнения кнопки
public enum WAButtonType {
    case primary
    case secondry
}

final class WAButton: UIButton {
    private var type: WAButtonType = .primary //по умолчанию primary
   
    
    private let lable: UILabel = {
        let lable = UILabel()
        lable.textAlignment = .center //располагаем по центру
        
        return lable
    }()
    
    private let iconView: UIImageView = {
        let view = UIImageView()
        view.image = Resourses.Images.Commons.downArrow?.withRenderingMode(.alwaysTemplate)
        
        return view
    }()
    
    
    
    init(with type: WAButtonType) {
        super .init(frame: .zero)
        self.type = type
    
        
        setupViews()
        constaintViews()
        configureAppearence()
        
    }
    
    required init?(coder: NSCoder) {
        super .init(frame: .zero)
        setupViews()
        constaintViews()
        configureAppearence()
    
    }
        func setTitle(_ title: String?) {
            lable.text = title
    }
}

private extension WAButton {
    func setupViews() {
        addView(lable)
        addView(iconView)
    }
    
    func constaintViews() {
        var horizontalOffset: CGFloat {
            switch type {
            case .primary: return 0
            case .secondry: return 10
          }
        }
        
        NSLayoutConstraint.activate([
            
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalOffset),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            lable.centerYAnchor.constraint(equalTo: centerYAnchor),
            lable.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
            lable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalOffset * 2)
            
        ])
    }
   
    func configureAppearence() {
        
        switch type{
        case .primary:
            lable.font = Resourses.Fonts.helvelticaRegular(witht: 13)
            lable.textColor = Resourses.Colors.inactive
            iconView.tintColor = Resourses.Colors.inactive
        case .secondry:
            backgroundColor = Resourses.Colors.secondary
            lable.font = Resourses.Fonts.helvelticaRegular(witht: 15)
            layer.cornerRadius = 14
            lable.textColor = Resourses.Colors.active
            iconView.tintColor = Resourses.Colors.active
        }
        
        makeSystem(self)
       
    }
}
