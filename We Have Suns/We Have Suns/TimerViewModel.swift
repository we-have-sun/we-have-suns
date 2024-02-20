//
//  TimerViewModel.swift
//  We Have Suns
//
//  Created by Natalia Terlecka on 20/02/2024.
//

import Foundation
import Combine

class TimerViewModel: ObservableObject {
    @Published var progress: CGFloat = 0.0
    var timer: Timer?
    var isTimerRunning = false
    let totalTime: CGFloat = 10.0 // Total time of the timer in seconds
    
    func startTimer() {
        guard !isTimerRunning else { return }
        isTimerRunning = true
        progress = 0.0 // Reset progress
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.progress < self.totalTime {
                self.progress += 0.1
            } else {
                self.stopTimer()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        isTimerRunning = false
    }
}
