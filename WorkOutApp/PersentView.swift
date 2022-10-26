//
//  PersentView.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 26.10.2022.
//

import Foundation
import UIKit

extension TimerView {
    final class PersentView: BaseView {
        
        private let stackView: UIStackView = {
           let stack = UIStackView()
            stack.axis = .vertical
            stack.distribution = .fillProportionally
            stack.spacing = 5
            return stack
        }()
        
        private let percentLabel: UILabel = {
            let label = UILabel()
            label.font = Resourses.Fonts.helvelticaRegular(witht: 23)
            label.textColor = Resourses.Colors.darkGray
            label.textAlignment = .center
            return label
        }()
        
        private let subTitleLabel: UILabel = {
            let label = UILabel()
            label.font = Resourses.Fonts.helvelticaRegular(witht: 10)
            label.textColor = Resourses.Colors.inactive
            label.textAlignment = .center
            return label
        }()
        
        override func setupViews() {
            super.setupViews()
            
            addView(stackView)
            stackView.addArrangedSubview(percentLabel)
            stackView.addArrangedSubview(subTitleLabel)
        }
        
        override func constaintViews() {
            super.constaintViews()
            
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
        
        func configure(title: String, andValue value: Int) {
            subTitleLabel.text = title
            percentLabel.text = "\(value)%"
        }
        
        override func configureAppearence() {
            super.configureAppearence()
            
           // stackView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
    

