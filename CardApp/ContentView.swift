//
//  ContentView.swift
//  CardApp
//
//  Created by Naoki Yoshida on 2022/02/17.
//

import SwiftUI

struct ContentView: View {
    var cards = ["ありがとう": "Thank you",
                 "こんにちは": "Hello",
                 "またね": "See you"]
    @State var japanese = "ありがとう"
    @State var isJapanese = true
    var body: some View {
        ZStack {
            Color(red: 9.7, green: 0.96, blue: 0.56)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    Image("card")
                        .resizable()
                        .frame(width: 300.0, height: 133.0)
                        .shadow(radius: 3)
                        .rotation3DEffect(.degrees(isJapanese ? 0 : 180),
                                          axis: (x: 0, y: 0, z: 1))
                        .animation(.spring())
                        .onTapGesture {
                            self.isJapanese.toggle()
                        }
                    Text(isJapanese ? japanese : cards[japanese]!)
                        .font(.largeTitle)
                }.padding()
                HStack {
                    Group {
                        Button(action: {
                            self.isJapanese.toggle()
                        }) {
                            Image(systemName: "arrow.2.circlepath")
                            Text(/*@START_MENU_TOKEN@*/"FLIP"/*@END_MENU_TOKEN@*/)
                        }
                        Button(action: {
                            self.isJapanese = true
                            self.japanese = self.cards.randomElement()!.key
                        }) {
                            Image(systemName: "forward.fill")
                            Text(/*@START_MENU_TOKEN@*/"NEXT"/*@END_MENU_TOKEN@*/)
                        }
                    }.padding()
                        .foregroundColor(.white)
                        .background(Color(red: 0.86, green: 0.45, blue: 0.03))
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
