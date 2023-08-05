//
//  Emoji_CardView.swift
//  Feedback_Demo
//
//  Created by Twinkle Mehta on 05/08/23.
//

import SwiftUI

struct Emoji_CardView: View {
    
    // MARK:- PROPERTIES
    
    let reactions = ["😥" , "☹️" , "🙂" , "😋" , "🤩"]
    @State var selectedEmoji: String = ""
    @State var hideHeader: Double = 1
    @State var sendOffset: CGFloat = 0
    @State var sendWidth: CGFloat = 150
    @State var removeText: Bool = false
    @Binding var firstEffect: CGFloat
    @Binding var secondEffect: CGFloat
    
    // MARK:- BODY
    
    var body: some View {
        VStack {
            // Header Content
            VStack {
                Text("How was your experience\nat Walmart Store?")
                    .font(Font.custom("Avenir-Heavy", size: 19))
                    .foregroundColor(Color.init(red: 13/255, green: 14/255, blue: 64/255))
                    .multilineTextAlignment(.center)
                Text("It will allow us to better serve you.")
                    .font(Font.custom("Avenir-Medium", size: 16))
                    .foregroundColor(Color.init(red: 159/255, green: 163/255, blue: 164/255))
                    .padding(.top,5)
                
                HStack(alignment: .center, spacing: 10){
                    ForEach(reactions , id: \.self) { reaction in
                        ZStack {
                            emojiView(selectedEmoji: $selectedEmoji, emojiText: reaction)
                                .frame(width: 50 , height: 50)
                                .background(Color.white)
                                .overlay(
                                        Circle()
                                            .stroke(Color.init(red: 144/255, green: 62/255, blue: 238/255), lineWidth: selectedEmoji == reaction ? 6 : 0)
                                )
                                .cornerRadius(25)
                                .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.1) , radius: 10 , x: 0 , y: 15)
                                .opacity(selectedEmoji == "" || selectedEmoji == reaction ? 1 : 0.5)
                            if selectedEmoji == reaction {
                                Image("check")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .offset(x: 18, y: -18)
                            }
                        }
                    }
                } //: HSTACK
                .padding(.top , 20)
                .padding(.bottom, 20)
                
                if selectedEmoji != "" {
                    Text(getEmoji(selectedEmoji))
                        .font(Font.custom("Avenir-Heavy", size: 17))
                        .foregroundColor(Color.init(red: 144/255, green: 62/255, blue: 238/255))
                }

            }
            .opacity(hideHeader)
            
            Button {
                withAnimation(.spring()){
                    hideHeader = 0
                    sendOffset = -116
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(Animation.easeInOut(duration: 0.3)){
                            sendWidth = 100
                            removeText = true
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation(Animation.easeInOut(duration: 0.3)){
                            sendWidth = 45
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation(Animation.easeInOut(duration: 1)){
                            firstEffect = 50
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                        withAnimation(Animation.easeInOut(duration: 1)){
                            secondEffect = 50
                        }
                    }
                }
            } label: {
                ZStack {
                    Capsule()
                        .fill(Color.init(red: 144/255, green: 62/255, blue: 238/255))
                        .frame(width: sendWidth, height: 45)
                    if removeText {
                        if sendWidth == 45 {
                            Image("check")
                                .resizable()
                                .frame(width: 20, height: 20)
                        } else {
                            HStack {
                                Image("check")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text("Sent")
                                    .font(Font.custom("Avenir-Heavy", size: 15))
                                    .foregroundColor(Color.white)
                            }
                        }
                    } else {
                        Text("Send feedBack")
                            .font(Font.custom("Avenir-Heavy", size: 15))
                            .foregroundColor(Color.white)
                    }
                    
                } //: ZSTACK
                .opacity(selectedEmoji == "" ? 0.7 : 1)
            } //: BUTTON
            .offset(x: 0.0, y: sendOffset)
            .disabled(selectedEmoji == "" ? true : false)
        }//: VSTACK
    }
    
    // MARK:- FUNCTION
    
    func getEmoji(_ emoji: String) -> String {
        switch emoji {
        case "😥":
            return "Very Bad"
        case "☹️":
            return "Bad"
        case "🙂":
            return "Average"
        case "😋":
            return "Good"
        case "🤩":
            return "Perfect"
        default:
            return ""
        }
    }

}
