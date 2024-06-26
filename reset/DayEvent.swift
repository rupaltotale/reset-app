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
        events.append(DayEvent(wakeTime: Date()))
        saveEvents()
    }
    
    func updateLiked(liked: Bool?) {
        events[events.count - 1].liked = liked
        saveEvents()
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
    
    func isAwakeView() -> Bool {
        if events.isEmpty {
            self.updateWakeUp()
            return false
        }
        return events.last?.sleepTime == nil
    }
}
