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
            
            // Quote from Buddha
            Text("“Three things cannot be long hidden: the sun, the moon, and the truth.”")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("- Buddha")
            
            Spacer()
            
            // Circular black button with "Sleep" text
            Button(action: {
                isAwake = false
            }) {
                Text("Sleep")
                    .font(.headline)
                    .padding()
                    .frame(width: 100, height: 100)
                    .foregroundColor(ColorScheme.light)
                    .background(ColorScheme.dark)
                    .clipShape(Circle())
            }
            
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
            
            Text("How was your day?")
            
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
            
            // Circular black button with "Wake Up" text
            Button(action: {
                isAwake = true
            }) {
                Text("Wake Up")
                    .font(.headline)
                    .padding()
                    .frame(width: 100, height: 100)
                    .foregroundColor(ColorScheme.dark)
                    .background(ColorScheme.light)
                    .clipShape(Circle())
            }
            
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
