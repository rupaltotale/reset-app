//
//  DayEvent.swift
//  reset
//
//  Created by Rupal Totale on 6/25/24.
//

import Foundation

struct DayEvent: Codable {
    let sleepTime: Date
    var wakeTime: Date?
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
        events.append(DayEvent(sleepTime: Date()))
        saveEvents()
    }
    
    func updateWakeUp() {
        events[events.count - 1].wakeTime = Date()
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
        return events
    }

    func getEvent(at index: Int) -> DayEvent? {
        guard index >= 0 && index < events.count else { return nil }
        return events[index]
    }

    func clearAllEvents() {
        events.removeAll()
        saveEvents()
    }
    
    func isAwakeView() -> Bool {
        if events.isEmpty {
            return true
        }
        return events.last?.wakeTime != nil
    }
}
