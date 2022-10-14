//
//  BaseInfoView.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 14.10.2022.
//

import Foundation
import UIKit

class BaseInfoView: BaseView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resourses.Fonts.helvelticaRegular(witht: 13)
        label.textColor = Resourses.Colors.inactive
        //label.text = "test".uppercased()
        
        return label
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = Resourses.Colors.seporator.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        
        return view
}()

    //кастомный инит (устанавливаем label.text через инициализацию ):
    init(with title: String? = nil, alignment: NSTextAlignment = .left) {
        //super.init(frame: .zero) - опускаем вниз, что бы в момент запуска сперва проверялось наличей тайтла и констрейтов
        
        titleLabel.text = title?.uppercased()
        titleLabel.textAlignment = alignment
        super.init(frame: .zero)
    }
    
     required init?(coder: NSCoder) {
        super.init(frame: .zero)

  }
}

extension BaseInfoView {
    override func setupViews() {
        super.setupViews()
        
        addView(titleLabel)
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
