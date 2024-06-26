//
//  ContentView.swift
//  reset
//
//  Created by Rupal Totale on 6/19/24.
//

import SwiftUI
import CoreData

struct AwakeView: View {
    @Binding var isAwake: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Reflect on this today...")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            // Quote from Buddha
            Text("“Three things cannot be long hidden: the sun, the moon, and the truth.”")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("- Buddha")
            
            Spacer()
            
            LongPressButton(
                current: ColorScheme.dark,
                next: ColorScheme.light,
                label: "Sleep",
                onComplete: {isAwake = false}
            )
            
            Spacer()
        }
        .padding()
        .applyLightPageStyles()
    }
}

struct SleepView: View {
    @Binding var isAwake: Bool
    @State private var liked = false
    @State private var disliked = false
    
    var body: some View {
        VStack {
            Spacer()
            
            // Good Night message
            Text("Goodnight, sweet dreams")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            // Question "How was your day?"
            Text("Did you have a good day?")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            // Like and Dislike buttons
            HStack(spacing: 40) {
                Button(action: {
                    liked.toggle()
                    disliked = false
                }) {
                    Image(systemName: liked ? "hand.thumbsup.fill" : "hand.thumbsup")
                        .foregroundColor(.green)
                        .font(.title)
                }
                
                Button(action: {
                    disliked.toggle()
                    liked = false
                }) {
                    Image(systemName: disliked ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                        .foregroundColor(.red)
                        .font(.title)
                }
            }
            .padding()
            
            Spacer()
            
            LongPressButton(
                current: ColorScheme.light,
                next: ColorScheme.dark,
                label: "Wake Up",
                onComplete: {isAwake = true}
            )
            
            Spacer()
        }
        .padding().applyDarkPageStyles()
    }
}

struct ContentView: View {
    @State private var isAwake = true
    var body: some View {
        VStack {
            if isAwake {
                AwakeView(isAwake: $isAwake)
            } else {
                SleepView(isAwake: $isAwake)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
