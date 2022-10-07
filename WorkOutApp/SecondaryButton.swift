//
//  SecondaryButton.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 07.10.2022.
//

import Foundation
import UIKit

final class SecondaryButton: UIButton {
    
    private let lable = UILabel()
    private let iconView = UIImageView()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        lable.text = title
    }
    
}

private extension SecondaryButton {
    func addViews() {
        addSubview(lable)
        addSubview(iconView)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            lable.centerYAnchor.constraint(equalTo: centerYAnchor),
            lable.trailingAnchor.constraint(equalTo: iconView.leadingAnchor),
            lable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
            
        ])
    }
   
    func configure() {
        backgroundColor = Resourses.Colors.secondary
        layer.cornerRadius = 14
        makeSystem(self)
        
        lable.toAutoLayout()
        lable.textColor = Resourses.Colors.active
        lable.textAlignment = .center //располагаем по центру
        lable.font = Resourses.Fonts.helvelticaRegular(witht: 15)
        
        iconView.toAutoLayout()
        iconView.image = Resourses.Images.Commons.downArrow?.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = Resourses.Colors.active
    }
}