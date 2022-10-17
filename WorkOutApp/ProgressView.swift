//
//  ProgressView.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 16.10.2022.
//

import Foundation
import UIKit

extension TimerView {
    final class ProgressView: UIView {
        
        func drawProgress(with percent: CGFloat) {
           
            //создаю круговой "безель"
            let circleFrame = UIScreen.main.bounds.width - (15 + 40) * 2
            let radius = circleFrame / 2
            let center = CGPoint(x: radius, y: radius)
            let startAngle = -CGFloat.pi * 7/6
            let endAngle = CGFloat.pi * 1/6
            
            let circlePath = UIBezierPath(arcCenter: center,
                                          radius: radius,
                                          startAngle: startAngle,
                                          endAngle: endAngle,
                                          clockwise: true)
            
            //создаю лэер который будет бегать по безелю:
            
            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath
            circleLayer.strokeColor = Resourses.Colors.active.cgColor
            circleLayer.lineWidth = 20
            circleLayer.strokeEnd = percent
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.lineCap = .round //делаю закругленные края
            
            
            
            layer.addSublayer(circleLayer)
        }
    }
}
