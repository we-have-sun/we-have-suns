//
//  TimerView.swift
//  We Have Suns
//
//  Created by Natalia Terlecka on 20/02/2024.
//

import SwiftUI

struct TimerView: View {
    @StateObject private var viewModel = TimerViewModel()
    
    private var endAngle: Double {
        Double(self.viewModel.progress / self.viewModel.totalTime) * 360.0 - 90.0 // -90 to start from top
    }

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 2)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                
                PieSlice(startAngle: Angle(degrees: -90), endAngle: Angle(degrees: endAngle))
                    .fill(Color.blue)
                    .frame(width: 200, height: 200)
                    .animation(.linear(duration: self.viewModel.totalTime), value: self.viewModel.progress)

                Text(String(format: "%.1f", self.viewModel.progress))
                    .font(.largeTitle)
                    .bold()
                
                
            }
            .frame(width: 200, height: 200)
            
            HStack {
                Button(action: {
                    self.viewModel.startTimer()
                }) {
                    Text("Start")
                        .padding(20)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                }
                
                Button(action: {
                    self.viewModel.stopTimer()
                }) {
                    Text("Pause")
                        .padding(20)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                }
            }
        }
    }
}

//struct ContentView: View {
//    var body: some View {
//        TimerView()
//    }
//}
