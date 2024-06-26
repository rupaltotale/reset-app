//
//  GraphView.swift
//  reset
//
//  Created by Rupal Totale on 6/25/24.
//

import Foundation
import Charts
import SwiftUI

func calculateAveragesByWeekday(wakeTimes: [Date]) -> [(String, Int)] {
    var weekdaySums = [Int: Int]()
    var weekdayCounts = [Int: Int]()
    
    let calendar = Calendar.current
    
    for wakeTime in wakeTimes {
        let weekday = calendar.component(.weekday, from: wakeTime)
        let hour = calendar.component(.hour, from: wakeTime)
        
        weekdaySums[weekday, default: 0] += hour
        weekdayCounts[weekday, default: 0] += 1
    }
    
    let weekdays = calendar.weekdaySymbols
    var averages = [(String, Int)]()
    
    for i in 1...7 {
        if let sum = weekdaySums[i], let count = weekdayCounts[i] {
            let averageHour = sum / count
            averages.append((weekdays[i - 1], averageHour))
        }
    }
    
    return averages
}


struct PieChartView: View {
    @EnvironmentObject var storage: DayEventStorage

    var data: [(type: String, amount: Double)] {
        [
            (type: "Good Days", amount: storage.getTotalLikedDays()),
            (type: "Bad Days", amount: storage.getTotalDislikedDays())
        ]
    }
    
    // Color mapping based on type
    private func color(for type: String) -> Color {
        switch type {
        case "Good Days":
            return .green
        case "Bad Days":
            return .red
        default:
            return .gray
        }
    }

    var body: some View {
        VStack {
            Chart(data, id: \.type) { dataItem in
                SectorMark(
                    angle: .value(dataItem.type,
                                  dataItem.amount),
                    innerRadius: .ratio(0.5),
                    angularInset: 1.5)
                .cornerRadius(5)
                .foregroundStyle(color(for: dataItem.type))
                
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

struct BarChartView: View {
    let data: [(String, Int)] 
    let label: String
    let image: String

    var body: some View {
        VStack {
            HStack {
                Image(systemName: image)
                    .font(.system(size: 25))
                    .foregroundColor(.yellow)
                Text(label)
            }
            Chart {
                ForEach(data, id: \.0) { day, value in
                    BarMark(
                        x: .value("Day", day),
                        y: .value("Value", value)
                    )
                    .annotation(position: .top) {
                        Text("\(value)")
                            .font(.caption)
                    }
                }
            }
            .frame(height: 300)
            .padding()
        }
    }
}


struct GraphView: View {
    @EnvironmentObject var storage: DayEventStorage
    
    var body: some View {
        ScrollView{
            VStack (spacing: 30) {
                BarChartView(
                    data: calculateAveragesByWeekday(wakeTimes: storage.getAllWakeTimes()),
                    label: "Start the day, on average",
                    image: "sun.max.fill"
                )
                BarChartView(
                    data: calculateAveragesByWeekday(wakeTimes: storage.getAllSleepTimes()),
                    label: "End the day, on average",
                    image: "moon.stars.fill"
                )
                PieChartView()
            }
        }
    }
}


struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
            .environmentObject(DayEventStorage())
    }
}
