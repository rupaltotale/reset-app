//
//  LongButton.swift
//  reset
//
//  Created by Rupal Totale on 6/25/24.
//

import Foundation
import SwiftUI

struct LongPressButton: View {
    let current: Color
    let next: Color
    
    let label: String
    
    let onComplete: () -> Void
    
    @GestureState private var isDetectingLongPress = false
    @State private var completedLongPress = false


    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 1)
            .updating($isDetectingLongPress) { currentState, gestureState,
                    transaction in
                gestureState = currentState
                transaction.animation = Animation.easeIn(duration: 1.0)
            }
            .onEnded { finished in
                self.completedLongPress = finished
                onComplete()
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
            }
    }


    var body: some View {
        Button(action: {        }) {
            Text(label)
                .font(.headline)
                .padding()
                .frame(width: 100, height: 100)
                .foregroundColor(self.isDetectingLongPress ?
                                 current :
                                   (self.completedLongPress ? current : next))
                .background(self.isDetectingLongPress ?
                            next :
                              (self.completedLongPress ? next : current))
                .clipShape(Circle())            .gesture(longPress)

        }
    }
}

struct LongPressButton_Previews: PreviewProvider {
    static var previews: some View {
        LongPressButton(
            current: ColorScheme.light,
            next: ColorScheme.dark,
            label: "test",
            onComplete: {print("long pressed")})
    }
}
