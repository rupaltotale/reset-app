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
                                VStack(alignment: .leading) {
                                    HStack{
                                        Text("\(dateString(from: event.wakeTime))")
                                            .font(.headline)
                                        
                                        Spacer()
                                        
                                        if let liked = event.liked {
                                            Image(systemName: liked ? "hand.thumbsup.fill" : "hand.thumbsdown.fill")
                                                .foregroundColor(liked ? .green : .red)
                                                .font(.title)
                                        }
                                    }
                                    HStack {
                                        Image(systemName: "sun.max.fill")
                                            .font(.system(size: 25))
                                            .foregroundColor(.yellow)
                                        Text("\(timeString(from: event.wakeTime))")
                                        Spacer()
                                        Image(systemName: "moon.stars.fill")
                                            .font(.system(size: 25))
                                            .foregroundColor(.yellow)
                                        Text("\(timeString(from: event.sleepTime!))")
                                    }.padding()
                                }
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
//        storage.updateWakeUp()
//        storage.updateSleep()
//        storage.updateLiked(liked: true, disliked: false)
        return HistoryView().environmentObject(storage)
    }
}
