//
//  JournalView.swift
//  reset
//
//  Created by Rupal Totale on 6/26/24.
//

import Foundation
import SwiftUI

struct JournalInputView: View {
    @State var journal: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                
                TextEditor(text: $journal)
                    .frame(minHeight: 100, maxHeight: 150) // Adjust height as needed
                    .lineLimit(3) // Limit to 3 lines
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                    if journal.isEmpty {
                        Text("Describe your day...")
                            .foregroundColor(.gray).padding(5)
                            .padding(.horizontal)
                    }
            }
        }
        .padding()
    }
}
struct JournalInputView_Previews: PreviewProvider {
    static var previews: some View {
        var exampleText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        
        return JournalInputView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

