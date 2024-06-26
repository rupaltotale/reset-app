//
//  DayEvent.swift
//  reset
//
//  Created by Rupal Totale on 6/25/24.
//

import Foundation

struct DayEvent: Codable, Identifiable {
    var id: UUID = UUID()
    var sleepTime: Date?
    let wakeTime: Date
    var liked: Bool?
    let quote: [String: String]?
}

class DayEventStorage: ObservableObject {
    private let key = "DayEventStorageKey"
    private var events: [DayEvent] = []
    
    init() {
        loadEvents()
    }

    private func loadEvents() {
        if let savedData = UserDefaults.standard.data(forKey: key) {
            let decoder = JSONDecoder()
            if let loadedEvents = try? decoder.decode([DayEvent].self, from: savedData) {
                events = loadedEvents
            }
        }
    }

    private func saveEvents() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(events) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    func updateSleep() {
        events[events.count - 1].sleepTime = Date()
        saveEvents()
    }
    
    func updateWakeUp() {
        events.append(DayEvent(wakeTime: Date(), quote: quotes.randomElement()!))
        saveEvents()
    }
    
    func updateLiked(liked: Bool, disliked: Bool) {
        var finalState: Bool?
        if (liked && !disliked) {
            finalState = true
        } else if (disliked && !liked) {
            finalState = false
        }
        events[events.count - 1].liked = finalState
        saveEvents()
    }
    
    func getLiked() -> Bool? {
        return events.last?.liked
    }

    func addEvent(_ event: DayEvent) {
        events.append(event)
        saveEvents()
    }

    func removeEvent(at index: Int) {
        guard index >= 0 && index < events.count else { return }
        events.remove(at: index)
        saveEvents()
    }

    func getAllEvents() -> [DayEvent] {
        return events.reversed()
    }

    func getEvent(at index: Int) -> DayEvent? {
        guard index >= 0 && index < events.count else { return nil }
        return events[index]
    }

    func clearAllEvents() {
        events.removeAll()
        saveEvents()
    }
    
    func getWakeUpTime() -> Date {
        return events[events.count - 1].wakeTime
    }
    
    func getSleepTime() -> Date? {
        return events[events.count - 1].sleepTime
    }
    
    func getQuote() -> [String: String] {
        return events[events.count - 1].quote ?? ["quote": "Every morning we are born again. What we do today is what matters most.", "author": "Buddha"]
    }
    
    func isAwakeView() -> Bool {
        if events.isEmpty {
            // TODO if list is empty, present a screen to start the day
            self.updateWakeUp()
            return false
        }
        return events.last?.sleepTime == nil
    }
    
    func averageWakeUpTime(for weekday: Int) -> Double {
        let filteredEvents = events.filter { Calendar.current.component(.weekday, from: $0.wakeTime) == weekday }
        
        guard !filteredEvents.isEmpty else {
            return 0
        }
        
        let totalWakeUpHour = filteredEvents.reduce(0.0) { total, event in
            total + Double(Calendar.current.component(.hour, from: event.wakeTime))
        }
        
        return totalWakeUpHour / Double(filteredEvents.count)
    }
    
    func averageSleepTime(for weekday: Int) -> Double {
        let filteredEvents = events.filter { $0.sleepTime != nil && Calendar.current.component(.weekday, from: $0.sleepTime!) == weekday }
        
        guard !filteredEvents.isEmpty else {
            return 0
        }
        
        let totalSleepHour = filteredEvents.reduce(0.0) { total, event in
            total + Double(Calendar.current.component(.hour, from: event.sleepTime!))
        }
        
        return totalSleepHour / Double(filteredEvents.count)
    }

}
