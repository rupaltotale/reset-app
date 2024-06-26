//
//  utils.swift
//  reset
//
//  Created by Rupal Totale on 6/25/24.
//

import Foundation
import SwiftUI

struct ColorScheme {
    static let light = Color("light")
    static let dark = Color("dark")
}

extension View {
    func applyLightPageStyles() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(ColorScheme.light)
            .foregroundColor(ColorScheme.dark)
    }
    
    func applyDarkPageStyles() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(ColorScheme.dark)
            .foregroundColor(ColorScheme.light)
    }
    
}

func timeString(from date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm a"
    return formatter.string(from: date)
}

func dateString(from date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMMM d"
    return formatter.string(from: date)
}



func dateTimeString(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter.string(from: date)
}
