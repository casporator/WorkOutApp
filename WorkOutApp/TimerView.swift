//
//  TimerView.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 16.10.2022.
//

import Foundation
import UIKit

final class TimerView: WABaseInfoView {
    
    private let progressView: ProgressView = {
       let view = ProgressView()
        view.drawProgress(with: 0)
        
        return view
    }()
}


extension TimerView {
    
    override func setupViews() {
        super.setupViews()
        
        addView(progressView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
           
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor)
        ])
    }
    
    override func configureAppearence() {
        super.configureAppearence()
        
        progressView.backgroundColor = .blue
    }
    
}
