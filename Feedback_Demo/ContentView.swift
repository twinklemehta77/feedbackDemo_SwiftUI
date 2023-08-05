//
//  ContentView.swift
//  Feedback_Demo
//
//  Created by Twinkle Mehta on 05/08/23.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    
    // MARK:- PROPERTIES
    @State var firstEffect: CGFloat = 0
    @State var secondEffect: CGFloat = 0
    
    // MARK:- BODY
    
    var body: some View {
        ZStack {
            Color.init(red: 238/255, green: 241/255, blue: 243/255)
                .ignoresSafeArea()
            Emoji_CardView(firstEffect: $firstEffect , secondEffect: $secondEffect )
                .padding(30)
                .frame(width: 370)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.1) , radius: 20 , x: 10 , y: 20)
            Circle()
                .fill(Color.init(red: 102/255, green: 0/255, blue: 204/255))
                .frame(width: 45, height: 45)
                .scaleEffect(firstEffect)
            Circle()
                .fill(Color.init(red: 153/255, green: 51/255, blue: 255/255))
                .frame(width: 45, height: 45)
                .scaleEffect(secondEffect)
        } //: ZSTACK
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
