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
//        events = createSampleDayEvents()
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
        
        // delete from the end since list is rendered in reverse
        let reversedIndex = events.count - 1 - index
        events.remove(at: reversedIndex)
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
    
    func getWakeUpTime() -> Date? {
        return events.last?.wakeTime
    }
    
    func getSleepTime() -> Date? {
        return events.last?.sleepTime
    }
    
    func getQuote() -> [String: String] {
        return events.last?.quote ?? ["quote": "Three things cannot long be hidden: the sun, the moon, and the truth.", "author": "Buddha"]
    }
    
    func isAwakeView() -> Bool {
        if events.isEmpty {
            // TODO if list is empty, present a screen to start the day
            self.updateWakeUp()
            return true
        }
        return events.last?.sleepTime == nil
    }
    
    func getAllWakeTimes() -> [Date] {
        return events.map { $0.wakeTime }
    }
    
    func getAllSleepTimes() -> [Date] {
        return events.compactMap{ $0.sleepTime }
    }
    
    func getTotalLikedDays() -> Double {
        return Double(events.filter { $0.liked == true }.count)
    }
    
    func getTotalDislikedDays() -> Double {
        return Double(events.filter { $0.liked == false }.count)
    }

}

func createSampleDayEvents() -> [DayEvent] {
    let calendar = Calendar.current
    let today = Date()
    
    // Helper function to create a Date with specific hour and minute
    func createDate(hour: Int, minute: Int, daysAgo: Int) -> Date {
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: today)
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.day = (dateComponents.day ?? 0) - daysAgo
        return calendar.date(from: dateComponents) ?? today
    }
    
    let sleepTimes = [
        createDate(hour: 2, minute: 0, daysAgo: 1),
        createDate(hour: 0, minute: 0, daysAgo: 2),
        createDate(hour: 0, minute: 0, daysAgo: 3),
        createDate(hour: 23, minute: 30, daysAgo: 4),
        createDate(hour: 22, minute: 45, daysAgo: 5),
        createDate(hour: 23, minute: 15, daysAgo: 6),
        createDate(hour: 23, minute: 0, daysAgo: 7),
        createDate(hour: 22, minute: 30, daysAgo: 8),
        createDate(hour: 23, minute: 0, daysAgo: 9),
        createDate(hour: 23, minute: 0, daysAgo: 10),
        createDate(hour: 22, minute: 0, daysAgo: 11),
        createDate(hour: 23, minute: 0, daysAgo: 12),
        createDate(hour: 23, minute: 30, daysAgo: 13),
        createDate(hour: 22, minute: 45, daysAgo: 14),
        createDate(hour: 23, minute: 15, daysAgo: 15),
        createDate(hour: 23, minute: 0, daysAgo: 16),
        createDate(hour: 22, minute: 30, daysAgo: 17),
        createDate(hour: 23, minute: 0, daysAgo: 18),
        createDate(hour: 23, minute: 0, daysAgo: 19),
        createDate(hour: 22, minute: 0, daysAgo: 20)
    ]
    
    let wakeTimes = [
        createDate(hour: 6, minute: 0, daysAgo: 1),
        createDate(hour: 8, minute: 0, daysAgo: 2),
        createDate(hour: 6, minute: 0, daysAgo: 3),
        createDate(hour: 7, minute: 30, daysAgo: 4),
        createDate(hour: 8, minute: 45, daysAgo: 5),
        createDate(hour: 6, minute: 15, daysAgo: 6),
        createDate(hour: 7, minute: 0, daysAgo: 7),
        createDate(hour: 8, minute: 30, daysAgo: 8),
        createDate(hour: 9, minute: 0, daysAgo: 9),
        createDate(hour: 7, minute: 0, daysAgo: 10),
        createDate(hour: 8, minute: 0, daysAgo: 11),
        createDate(hour: 9, minute: 0, daysAgo: 12),
        createDate(hour: 7, minute: 30, daysAgo: 13),
        createDate(hour: 8, minute: 45, daysAgo: 14),
        createDate(hour: 9, minute: 15, daysAgo: 15),
        createDate(hour: 7, minute: 0, daysAgo: 16),
        createDate(hour: 8, minute: 30, daysAgo: 17),
        createDate(hour: 9, minute: 0, daysAgo: 18),
        createDate(hour: 7, minute: 0, daysAgo: 19),
        createDate(hour: 8, minute: 0, daysAgo: 20)
    ]
    
    let likedStatuses: [Bool?] = [
        true, false, true, nil, false,
        true, nil, true, false, true,
        nil, false, true, false, nil,
        true, false, true, nil, true
    ]
    
    var events: [DayEvent] = []
    
    for i in 0..<20 {
        let event = DayEvent(sleepTime: sleepTimes[i], wakeTime: wakeTimes[i], liked: likedStatuses[i], quote: nil)
        events.append(event)
    }
    events.append(DayEvent(wakeTime: wakeTimes[0], quote: nil))
    
    return events
}
