//
//  GraphView.swift
//  reset
//
//  Created by Rupal Totale on 6/25/24.
//

import Foundation
import SwiftUI
import SwiftUICharts
import Charts

import SwiftUI

struct PieChartExampleView: View {
    var likedDaysTotal: Double {
        5 // Example value for liked days
    }

    var dislikedDaysTotal: Double {
        2 // Example value for disliked days
    }

    var data: [(type: String, amount: Double)] {
        [
            (type: "Good Days", amount: likedDaysTotal),
            (type: "Bad Days", amount: dislikedDaysTotal)
        ]
    }

    var maxType: String? {
        data.max { $0.amount < $1.amount }?.type
    }

    var body: some View {
        VStack {
            
            Chart(data, id: \.type) { dataItem in
                SectorMark(angle: .value(dataItem.type, dataItem.amount),
                           innerRadius: .ratio(0.5),
                           angularInset: 1.5)
                    .cornerRadius(5)
                    .opacity(dataItem.type == maxType ? 1 : 0.5)
            }
            .frame(height: 200)
            
            HStack(spacing: 20) {
                ForEach(data, id: \.type) { dataItem in
                    VStack {
                        Text(dataItem.type)
                            .font(.headline)
                        Text("\(Int(dataItem.amount))")
                            .font(.subheadline)
                    }
                }
            }
            .padding(.top, 20)
        }
        .padding()
    }
}

//struct PieChartExampleView_Previews: PreviewProvider {
//    static var previews: some View {
//        PieChartExampleView()
//    }
//}


struct GraphView: View {
    @EnvironmentObject var storage: DayEventStorage
    
    var body: some View {
        VStack (spacing: 30) {
            HStack{
                BarChartView(data: ChartData(values: [
                    ("Sun", 7),
                    ("Mon", 8),
                    ("Tue", 6),
                    ("Wed", 9),
                    ("Thu", 10),
                    ("Fri", 8),
                    ("Sat", 8)
                    
//                    ("Sun", storage.averageWakeUpTime(for: 0)),
//                    ("Mon", storage.averageWakeUpTime(for: 1)),
//                    ("Tue", storage.averageWakeUpTime(for: 2)),
//                    ("Wed", storage.averageWakeUpTime(for: 3)),
//                    ("Thu", storage.averageWakeUpTime(for: 4)),
//                    ("Fri", storage.averageWakeUpTime(for: 5)),
//                    ("Sat", storage.averageWakeUpTime(for: 6))
                ]),
                             title: "Start the day",
                             legend: "",
                             cornerImage: Image(systemName: "sun.max.fill"),
                             valueSpecifier: "%.2f"
                             
                )
                
                BarChartView(data: ChartData(values: [
                    
                        ("Sun", 17),
                        ("Mon", 18),
                        ("Tue", 16),
                        ("Wed", 19),
                        ("Thu", 21),
                        ("Fri", 15),
                        ("Sat", 17)
//                    ("Sun", storage.averageSleepTime(for: 0)),
//                    ("Mon", storage.averageSleepTime(for: 1)),
//                    ("Tue", storage.averageSleepTime(for: 2)),
//                    ("Wed", storage.averageSleepTime(for: 3)),
//                    ("Thu", storage.averageSleepTime(for: 4)),
//                    ("Fri", storage.averageSleepTime(for: 5)),
//                    ("Sat", storage.averageSleepTime(for: 6))
                ]),
                             title: "End the day",
                             legend: "",
                             cornerImage: Image(systemName: "moon.fill"),
                             valueSpecifier: "%.2f")
            }
            PieChartExampleView()
        }
    }
}


struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
            .environmentObject(DayEventStorage())
    }
}
