//
//  StatsItemView.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 04.11.2022.
//

import Foundation
import UIKit

enum StatsItem {
    case averagePace(value: String)
    case heartRate(value: String)
    case totalDistance(value: String)
    case totalSteps(value: String)
    
    var data: StatsItemView.ItemData {
        switch self {
        case.averagePace(let value):
            return .init(image: Resourses.Images.Stats.speed,
                         value: value + "/ km",
                         title: Resourses.Strings.progressView.averagePace)
        case.heartRate(let value):
            return .init(image: Resourses.Images.Stats.heart,
                         value: value + " bpm",
                         title: Resourses.Strings.progressView.heartRate)
        case.totalDistance(let value):
            return .init(image: Resourses.Images.Stats.maps,
                         value: value + " km",
                         title: Resourses.Strings.progressView.totalDistance)
        case.totalSteps(let value):
            return .init(image: Resourses.Images.Stats.steps,
                         value: value,
                         title: Resourses.Strings.progressView.stepsCounter)
            
        }
    }
}

final class StatsItemView: BaseView {
    
    struct ItemData {
        let image: UIImage?
        let value: String
        let title: String
    }
    
    private let imageView = UIImageView()
    
    private let valueLable: UILabel = {
       let lable = UILabel()
        lable.font = Resourses.Fonts.helvelticaRegular(witht: 17)
        lable.textColor = Resourses.Colors.darkGray
        return lable
    }()
    
    private let titleLable: UILabel = {
       let lable = UILabel()
        lable.font = Resourses.Fonts.helvelticaRegular(witht: 10)
        lable.textColor = Resourses.Colors.inactive
        return lable
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    func configure(with item: StatsItem) {
        imageView.image = item.data.image
        valueLable.text = item.data.value
        titleLable.text = item.data.title.uppercased()
    }
    
}

extension StatsItemView {
   override func setupViews() {
       super.setupViews()
       addView(imageView)
       addView(stackView)
       stackView.addArrangedSubview(valueLable)
       stackView.addArrangedSubview(titleLable)
       
   }
    
    override func constaintViews() {
        super.constaintViews()

        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 23),
            imageView.heightAnchor.constraint(equalToConstant: 23),

            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    override func configureAppearence() {
        super.configureAppearence()
    }
    
}
