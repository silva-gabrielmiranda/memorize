//
//  ContentView.swift
//  Memorize2021
//
//  Created by Gabriel Miranda on 28/11/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🛵","🏍","🛺","🚔","🚍","🚘","🚖","🚡","🚠"]
    
    @State var emojiCount = 10
    
    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle).bold()
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]){
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
                themeVehicles
                Spacer()
                themeConstructions
                Spacer()
                themeSmiles
            }
            .font(.title2)
        }
        .padding(.horizontal)
    }
    
    var themeVehicles: some View{
        Button(action: {
            emojis = [ "🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🛵", "🏍", "🛺", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠" ].shuffled()
            emojiCount = Int.random(in: 8..<emojis.count)
        }, label: {
            VStack{
                Text("Vehicles")
                Image(systemName: "car")
            }
        })
    }
    var themeConstructions: some View{
        Button(action: {
            emojis = [  "🏕", "⛺️", "🛖", "🏠", "🏡", "🏘", "🏚", "🏗", "🏭", "🏢", "🏬", "🏣", "🏤", "🏥", "🏦", "🏨", "🏪", "🏫", "🏩", "💒", "🏛", "⛪️", "🕌", "🕍" ].shuffled()
            emojiCount = Int.random(in: 8..<emojis.count)
        }, label: {
            VStack{
                Text("Constructions")
                Image(systemName: "house")
            }
        })
    }
    var themeSmiles: some View{
        Button(action: {
            emojis = [ "😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇", "🙂", "🙃", "😉", "😌", "😍", "🥰", "😘", "😗" ].shuffled()
            emojiCount = Int.random(in: 8..<emojis.count)
        }, label: {
            VStack{
                Text("Smiles")
                Image(systemName: "person")
            }
        })
    }
    
}

struct CardView: View{
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 10)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else {
                shape.fill()
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

