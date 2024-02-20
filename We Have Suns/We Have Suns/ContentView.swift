//
//  ContentView.swift
//  We Have Suns
//
//  Created by Natalia Terlecka on 18/02/2024.
//

import SwiftUI
import SwiftData


struct CircleItem: Identifiable {
    let id = UUID()
    let color: Color
}

struct CircleGridView: View {
    // Dynamic dataset of circle items
    let items: [CircleItem] = [.init(color: .red), .init(color: .yellow), .init(color: .yellow), .init(color: .orange), .init(color: .red), .init(color: .red), .init(color: .yellow), .init(color: .yellow), .init(color: .orange), .init(color: .red), .init(color: .red), .init(color: .yellow), .init(color: .yellow), .init(color: .orange), .init(color: .red), .init(color: .red), .init(color: .yellow), .init(color: .yellow), .init(color: .orange), .init(color: .red), .init(color: .red), .init(color: .yellow), .init(color: .yellow), .init(color: .orange), .init(color: .red), .init(color: .red), .init(color: .yellow), .init(color: .yellow), .init(color: .orange), .init(color: .red), ].shuffled()
    
    // Define the grid layout
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Play button
                    NavigationLink(destination: TimerView()) {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                            .foregroundColor(.blue)
                            .padding()
                    }
                    
                    // Grid of circles
                    LazyVGrid(columns: columns, spacing: 40) {
                        ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                            ZStack {
                                Circle()
                                    .fill(
                                        RadialGradient(
                                            gradient: Gradient(colors: [item.color.opacity(0.3), item.color]),
                                            center: .center,
                                            startRadius: 0,
                                            endRadius: 70
                                        )
                                    )
                                    .frame(width: 70, height: 70) // Set the size of the circles
                                    .shadow(color: item.color.opacity(0.9), radius: 15, x: 0, y: 0)

                                Text("\(index + 1)") // Display 1-based index
                                    .foregroundColor(self.textColor(for: item.color))
                                    .font(.headline)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Circle Grid")
        }
    }
    
    // Function to determine text color based on background color
    private func textColor(for backgroundColor: Color) -> Color {
        switch backgroundColor {
        case .yellow:
            return .black
        case .orange:
            return .white
        default:
            return .white // Default text color if not yellow or orange
        }
    }

}

struct ContentView: View {
    var body: some View {
        CircleGridView()
    }
}
