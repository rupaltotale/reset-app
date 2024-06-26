//
//  HistoryView.swift
//  reset
//
//  Created by Rupal Totale on 6/25/24.
//

import Foundation
import SwiftUI

struct HistoryView: View {
    @EnvironmentObject private var storage: DayEventStorage

    var body: some View {
        NavigationView {
            VStack {
                // TODO if complete set is not available, show placeholder view
                List {
                    ForEach(storage.getAllEvents()) { event in
                        if ((event.wakeTime) != nil){
                            VStack(alignment: .leading) {
                                Text("Sleep Time: \(formattedDateString(from: event.sleepTime))")
                                Text("Wake Time: \(formattedDateString(from: event.wakeTime!))")
                                Text("Liked: \(event.liked?.description ?? "Not specified")")
                            }
                        }
                    }
                    .onDelete(perform: deleteEvent)
                }
            }
        }
    }

    private func deleteEvent(at offsets: IndexSet) {
        offsets.forEach { index in
            storage.removeEvent(at: index)
        }
    }

    private func formattedDateString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        var storage = DayEventStorage()
        return HistoryView().environmentObject(storage)
    }
}
