//
//  BaseView.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 07.10.2022.
//

import Foundation
import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constaintViews()
        configureAppearence()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension BaseView {
    func setupViews() {}
    
    func constaintViews() {}
    
    func configureAppearence() {}
    
}
