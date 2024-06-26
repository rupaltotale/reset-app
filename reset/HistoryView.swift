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
    @State private var selection = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $selection) {
                    Text("History").tag(0)
                    Text("Trends").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(20)
                
                if (selection == 0) {
                    // TODO if complete set is not available, show placeholder view
                    List {
                        ForEach(storage.getAllEvents()) { event in
                            if (event.sleepTime != nil){
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("\(dateString(from: event.wakeTime))")
                                            .font(.headline)
                                        
                                        Text("You woke up at \(timeString(from: event.wakeTime)) and slept at \(timeString(from: event.sleepTime!))")
                                            .font(.body)
                                    }
                                    
                                    Spacer()
                                    
                                    if let liked = event.liked {
                                        Image(systemName: liked ? "hand.thumbsup.fill" : "hand.thumbsdown.fill")
                                            .foregroundColor(liked ? .green : .red)
                                            .font(.title)
                                    }
                                }
                                .padding(.vertical, 4)
                            }
                        }
                        .onDelete(perform: deleteEvent)
                    }
                }
                else {
                    GraphView()
                }
            } .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }

    private func deleteEvent(at offsets: IndexSet) {
        offsets.forEach { index in
            storage.removeEvent(at: index)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        let storage = DayEventStorage()
        return HistoryView().environmentObject(storage)
    }
}
