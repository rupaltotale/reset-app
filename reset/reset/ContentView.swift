//
//  ContentView.swift
//  reset
//
//  Created by Rupal Totale on 6/19/24.
//

import SwiftUI
import CoreData

func currentDateTimeString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: Date())
    }

struct AwakeView: View {
    @Binding var isAwake: Bool
    @EnvironmentObject var dayEventStorage: DayEventStorage
    
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
                onComplete: {
                    isAwake = false
                    dayEventStorage.updateSleep()
                }
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
    
    @EnvironmentObject var dayEventStorage: DayEventStorage
    
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
                onComplete: {
                    isAwake = true
                    dayEventStorage.updateWakeUp()
                }
            )
            
            Spacer()
        }
        .padding().applyDarkPageStyles()
    }
}

struct ContentView: View {
    @StateObject private var storage = DayEventStorage()
    @State private var isAwake: Bool = true
    
    var body: some View {
        VStack {
            if isAwake {
                AwakeView(isAwake: $isAwake)
            } else {
                SleepView(isAwake: $isAwake)
            }
        }
        .environmentObject(storage)
        .onAppear{
            isAwake = storage.isAwakeView()
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
