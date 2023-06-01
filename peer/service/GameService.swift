//
//  GameService.swift
//  peer
//
//  Created by Bryzgalov, Egor (A.) on 5/16/23.
//

import Foundation


class GameService: ObservableObject {
        
    @Published var time: Float = 30.0
    var timer: Timer!
    
    func startTimer() {
        timer =  Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if time == 0.0 {
            timer.invalidate()
            time = 0.0
        } else {
            time -= 1.0
        }
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d", minutes, seconds)
    }

    func resetTimer() {
        timer.invalidate()
        time = 30.0
        startTimer()
    }
    
    func removeTimer() {
        timer.invalidate()
    }
}
