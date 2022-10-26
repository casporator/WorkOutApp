//
//  TimerView.swift
//  WorkOutApp
//
//  Created by Oleg Popov on 16.10.2022.
//

import Foundation
import UIKit

enum TimerState {
    case isRuning
    case isPaused
    case isStopped
}

final class TimerView: WABaseInfoView {
    
    private let elapsedTimeLable: UILabel = {
       let lable = UILabel()
        lable.text = Resourses.Strings.Time.elapsedTime
        lable.font = Resourses.Fonts.helvelticaRegular(witht: 14)
        lable.textColor = Resourses.Colors.inactive
        lable.textAlignment = .center
        
        return lable
    }()
    
    private let elapsedTimeValueLable: UILabel = {
       let lable = UILabel()
        lable.font = Resourses.Fonts.helvelticaRegular(witht: 46)
        lable.textColor = Resourses.Colors.darkGray
        lable.textAlignment = .center
        
        return lable
    }()
    
    private let remainingTimeLable: UILabel = {
       let lable = UILabel()
        lable.text = Resourses.Strings.Time.remainingTime
        lable.font = Resourses.Fonts.helvelticaRegular(witht: 13)
        lable.textColor = Resourses.Colors.inactive
        lable.textAlignment = .center
        
        return lable
    }()
    
    private let  remainingTimeValueLable: UILabel = {
       let lable = UILabel()
        lable.font = Resourses.Fonts.helvelticaRegular(witht: 13)
        lable.textColor = Resourses.Colors.darkGray
        lable.textAlignment = .center
        
        return lable
    }()
    
    private let timeStackView: UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally // пропорциональное расположение
        view.spacing = 10
        
        return view
    }()
    
    private let bottomStackView: UIStackView = {
        let view = UIStackView()
         view.axis = .horizontal
         view.distribution = .fillProportionally
         view.spacing = 25
         
         return view
    }()
    
    private let completedPersentView = PersentView()
    
    private let remainingPersentView = PersentView()
    
    private let bottomSeporator: UIView = {
      let seporator = UIView()
        seporator.backgroundColor = Resourses.Colors.seporator
        
        return seporator
    }()
    
    
    private let progressView = ProgressView()
     
    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0
    
    public var state: TimerState = .isStopped 
    
    func configure(with duration: Double, progress: Double) {
        timerDuration = duration

        let tempCurrentValue = progress > duration ? duration : progress
        let goalValueDevider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDevider
        let roundedPersent = Int(round(percent * 100))
        
        elapsedTimeValueLable.text = getDisplayedString(from: Int(tempCurrentValue))
        remainingTimeValueLable.text = getDisplayedString(from: Int(duration) - Int(tempCurrentValue))
        completedPersentView.configure(title: "ЗАВЕРШЕНО", andValue: roundedPersent)
        remainingPersentView.configure(title: "OСТАЛОСЬ", andValue: 100 - roundedPersent)
        progressView.drawProgress(with: CGFloat(percent))
    }
    
    func startTimer() {
        
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: {[weak self] timer in
            guard let self = self else {return}
            self.timerProgress += 0.01
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate() //прерываем если таймер дошел до конца дюрейшина
            }
            
            self.configure(with: self.timerDuration, progress:  self.timerProgress)
        })
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    func stopTimre() {
        guard self.timerProgress > 0 else {return}
        timer.invalidate()
        
        //делаю обратный таймер (бежит назад)
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: {[weak self] timer in
            guard let self = self else {return}
            self.timerProgress -= self.timerDuration * 0.02
            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate() //прерываем если таймер дошел до конца дюрейшина
            }
            
            self.configure(with: self.timerDuration, progress:  self.timerProgress)
        })
    }
}

extension TimerView {
    
    override func setupViews() {
        super.setupViews()
        
        addView(progressView)
        addView(timeStackView)
        addView(bottomStackView)
        
        [
            elapsedTimeLable,
            elapsedTimeValueLable,
            remainingTimeLable,
            remainingTimeValueLable
        ].forEach{
            timeStackView.addArrangedSubview($0)
            
        [
            completedPersentView,
            bottomSeporator,
            remainingPersentView,
        ].forEach{
            bottomStackView.addArrangedSubview($0)
    }
  }
}
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
           
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            timeStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            timeStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            
            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
            bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 35),
            bottomStackView.widthAnchor.constraint(equalToConstant: 175),
            
            bottomSeporator.widthAnchor.constraint(equalToConstant: 1)
            
        ])
    }
    
    override func configureAppearence() {
        super.configureAppearence()
        
    }
        }
    
private extension TimerView {
    func getDisplayedString(from value: Int) -> String {
        let seconds = value % 60
        let minutes = (value / 60) % 60
        let hours = value / 3600
        
        let secondString = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minutesString = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let hoursString = hours < 10 ? "0\(hours)" : "\(hours)"
        
        return hours == 0
        ? [minutesString, secondString].joined(separator: ":")
        : [hoursString, minutesString, secondString].joined(separator: ":")
    }
    
  }


