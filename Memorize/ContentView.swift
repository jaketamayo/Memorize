//
//  ContentView.swift
//  Memorize
//
//  Created by Jacob Tamayo on 4/3/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️", "🚊", "⛴", "🚗", "🚌", "🏎", "🚀", "🚖", "🚙", "🚅"]
        
    //Emoji variable that controls how many emojis or CardViews will be displayed at once.
    @State var emojiCount = 4
    
    var body: some View {
        
        //Create a grid for the CardView using a LazyVStack and LazyVGrid
        
        VStack {
            HStack {
                //ForEach emoji, create a CardView
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                   CardView(content: emoji)
                }
            }
            .foregroundColor(.red)
            
            HStack {
                Button(action: {
                    //If emojiCount is greater then 1
                    if emojiCount > 1 {
                        emojiCount -= 1
                    }
                }, label: {
                    Image(systemName: "minus.circle")
                })
                Spacer()
                Button(action: {
                    //If emojiCount is less than the number of emojis in the array
                    if emojiCount < emojis.count {
                        emojiCount += 1
                    }
                }, label: {
                    Image(systemName: "plus.circle")
                })
                
            }
        }
        .padding(.horizontal)
        .font(.largeTitle)
    }
}



struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View {
        ZStack {
            if isFaceUp == true {
                RoundedRectangle(cornerRadius: 20)
                    .fill()
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3)
                Text(content)
                    .foregroundColor(.red)
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill()
            }
        }
        //Tap gesture that sets faceup to not equal true
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
        
    }
}













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
