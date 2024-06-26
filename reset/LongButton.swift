//
//  LongButton.swift
//  reset
//
//  Created by Rupal Totale on 6/25/24.
//

import Foundation
import SwiftUI

struct LongPressGestureView: View {
    @GestureState private var isDetectingLongPress = false
    @State private var completedLongPress = false


    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 3)
            .updating($isDetectingLongPress) { currentState, gestureState,
                    transaction in
                gestureState = currentState
                transaction.animation = Animation.easeIn(duration: 2.0)
            }
            .onEnded { finished in
                self.completedLongPress = finished
            }
    }


    var body: some View {
        Button(action: {        }) {
            Text("Sleep")
                .font(.headline)
                .padding()
                .frame(width: 100, height: 100)
                .foregroundColor(self.isDetectingLongPress ?
                                 ColorScheme.light :
                                   (self.completedLongPress ? ColorScheme.light : ColorScheme.dark))
                .background(self.isDetectingLongPress ?
                            Color.dark :
                              (self.completedLongPress ? ColorScheme.dark : ColorScheme.light))
                .clipShape(Circle())            .gesture(longPress)

        }
        
        Circle()
            .fill(self.isDetectingLongPress ?
                  Color.brown :
                    (self.completedLongPress ? ColorScheme.dark : ColorScheme.light))
            .frame(width: 100, height: 100, alignment: .center)
            .gesture(longPress)
    }
}

struct LongButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureView()
    }
}
