//
//  StatsView.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 04.11.2022.
//

import Foundation
import UIKit
import UIKit

final class StatsView: WABaseInfoView {

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 15
        return view
    }()

    func configure(with itmes: [StatsItem]) {
        itmes.forEach {
            let itmeView = StatsItemView()
            itmeView.configure(with: $0)
            stackView.addArrangedSubview(itmeView)
        }
    }
}

extension StatsView {
    override func setupViews() {
        super.setupViews()

        addView(stackView)
    }

    override func constaintViews() {
        super.constaintViews()

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
    }
}
