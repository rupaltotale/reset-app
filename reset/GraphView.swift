//
//  GraphView.swift
//  reset
//
//  Created by Rupal Totale on 6/25/24.
//

import Foundation
import SwiftUI
import SwiftUICharts

struct GraphView: View {
    @EnvironmentObject var storage: DayEventStorage
    
    var body: some View {
            VStack (spacing: 30) {
                BarChartView(data: ChartData(values: [
                    ("Sun", storage.averageWakeUpTime(for: 0)),
                    ("Mon", storage.averageWakeUpTime(for: 1)),
                    ("Tue", storage.averageWakeUpTime(for: 2)),
                    ("Wed", storage.averageWakeUpTime(for: 3)),
                    ("Thu", storage.averageWakeUpTime(for: 4)),
                    ("Fri", storage.averageWakeUpTime(for: 5)),
                    ("Sat", storage.averageWakeUpTime(for: 6))
                ]),
                             title: "Average wake up hour",
                             legend: "Weekday",
                             cornerImage: Image(systemName: "sun.max.fill"),
                             valueSpecifier: "%.2f"
                             
                )
                
                BarChartView(data: ChartData(values: [
                    ("Sun", storage.averageSleepTime(for: 0)),
                    ("Mon", storage.averageSleepTime(for: 1)),
                    ("Tue", storage.averageSleepTime(for: 2)),
                    ("Wed", storage.averageSleepTime(for: 3)),
                    ("Thu", storage.averageSleepTime(for: 4)),
                    ("Fri", storage.averageSleepTime(for: 5)),
                    ("Sat", storage.averageSleepTime(for: 6))
                ]),
                             title: "Average bedtime hour",
                             legend: "Weekday",
                             cornerImage: Image(systemName: "moon.fill"),
                             valueSpecifier: "%.2f")
            }
    }
}


struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
            .environmentObject(DayEventStorage())
    }
}
