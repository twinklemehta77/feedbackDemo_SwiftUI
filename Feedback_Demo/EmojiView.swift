//
//  EmojiView.swift
//  Feedback_Demo
//
//  Created by Twinkle Mehta on 05/08/23.
//

import SwiftUI

struct emojiView: View {
    
    // MARK:- PROPERTIES
    
    @Binding var selectedEmoji: String
    var emojiText: String
    
    // MARK:- BODY
    var body: some View {
        Button {
            withAnimation(.spring(response:0.3, dampingFraction: 0.5)){
                selectedEmoji = emojiText
            }
            
        } label:{
            Text(emojiText)
                .font(Font.custom("Avenir", size: 23))
        }
    }
}
