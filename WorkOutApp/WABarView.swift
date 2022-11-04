//
//  WABar.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 04.11.2022.
//

import Foundation
import UIKit

extension WABarView {
    struct Data {
        let value: String
        let heightMultiplire: Double
        let title: String
    }
}

final class WABarView: BaseView {
    
    private let heightMultiplire: Double
    
    private let valueLable: UILabel = {
        let lable = UILabel()
        lable.font = Resourses.Fonts.helvelticaRegular(witht: 13)
        lable.textColor = Resourses.Colors.active
        return lable
    }()
    
    private let barView: UIView = {
       let view = UIView()
        view.backgroundColor = Resourses.Colors.active
        view.layer.cornerRadius = 2.5
        
        return view
    }()
    
    private let titleLable: UILabel = {
        let lable = UILabel()
        lable.font = Resourses.Fonts.helvelticaRegular(witht: 10)
        lable.textColor = Resourses.Colors.darkGray
        return lable
    }()
    
    init(data: Data) {
        self.heightMultiplire = data.heightMultiplire
        super.init(frame: .zero)
        
        valueLable.text = data.value
        titleLable.text = data.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        self.heightMultiplire = 0
        super.init(frame: .zero)
    }
    
    
}
    
extension WABarView {
    override func setupViews() {
        super.setupViews()
        
        addView(valueLable)
        addView(barView)
        addView(titleLable)
        
    }
    
    override func constaintViews() {
        super.constaintViews()
    
        NSLayoutConstraint.activate([
            valueLable.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            barView.topAnchor.constraint(equalTo: valueLable.bottomAnchor, constant: 5),
            barView.centerXAnchor.constraint(equalTo: centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: 17),
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMultiplire, constant: -40),
            
            titleLable.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLable.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 10),
            titleLable.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
           
        ])
    }
    
    override func configureAppearence() {
        super.configureAppearence()
        
        backgroundColor = .clear
    }
}
