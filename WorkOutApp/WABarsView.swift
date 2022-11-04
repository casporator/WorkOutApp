//
//  WABarsView.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 04.11.2022.
//

import Foundation
import UIKit

final class WABarsView: BaseView {
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        return view
    }()
    
    func configure(with data: [WABarView.Data]) {
        data.forEach{
            let barView = WABarView(data: $0)
            
            stackView.addArrangedSubview(barView)
        }
    }
    
}

extension WABarsView {
    override func setupViews() {
        super.setupViews()
        
        addView(stackView)
        
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
    
    override func configureAppearence() {
        super.configureAppearence()
        
        backgroundColor = .clear
    }
}
