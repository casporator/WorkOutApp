//
//  BaseInfoView.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 14.10.2022.
//

import Foundation
import UIKit

class WABaseInfoView: BaseView {
    
   
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resourses.Fonts.helvelticaRegular(witht: 13)
        label.textColor = Resourses.Colors.darkGray
        //label.text = "test".uppercased()
        
        return label
    }()
    
    private let button = WAButton(with: .primary)
    
   let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = Resourses.Colors.seporator.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.layer.shadowColor = Resourses.Colors.darkGray.cgColor
        view.layer.shadowOffset = CGSize(width: 3, height: 3) //добавляем тень
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.6
        return view
}()

    //кастомный инит (устанавливаем label.text через инициализацию ):
    init(with title: String? = nil, buttonTitle: String? = nil) {
        //super.init(frame: .zero) - опускаем вниз, что бы в момент запуска сперва проверялось наличей тайтла и констрейтов
        
        titleLabel.text = title?.uppercased()
        // если кнопки нет, то тайтл по центру. если есть то слева
        titleLabel.textAlignment = buttonTitle == nil ? .center : .left
        button.setTitle(buttonTitle)
        button.isHidden = buttonTitle == nil ? true : false
        super.init(frame: .zero)
    }
    
     required init?(coder: NSCoder) {
        super.init(frame: .zero)

  }
    
    func addButtonTarget (target: Any? , action: Selector) {
        button.addTarget(target, action: action, for: .touchUpInside)
    }
}

extension WABaseInfoView {
    override func setupViews() {
        super.setupViews()
        
        addView(titleLabel)
        addView(button)
        addView(contentView)
        
    }
    override func constaintViews() {
        super.constaintViews()
        
        //делаю сдвигаемый констрейт для contentView:
        //если лэбла нет то контент вью имеет констрен 0 если лэбл есть, то констреин опускается на 10
        let ContentTopAnchor: NSLayoutAnchor = titleLabel.text == nil ? topAnchor : titleLabel.bottomAnchor
        let ContentTopOfFset: CGFloat = titleLabel.text == nil ? 0 : 10
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 130),
            button.heightAnchor.constraint(equalToConstant: 30),
            
            
            contentView.topAnchor.constraint(equalTo: ContentTopAnchor, constant: ContentTopOfFset),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        
        
        
        
        ])
    }
    
    override func configureAppearence() {
        super.configureAppearence()
        
        backgroundColor = .clear
    }
}
