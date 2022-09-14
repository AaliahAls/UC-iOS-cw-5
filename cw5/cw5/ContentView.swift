//
//  ContentView.swift
//  cw5
//
//  Created by khaled falah alazemi  on 14/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State var emojies = ["😀","🥲","☺️","😍", "😌","😡","😨"]
    @State var emoji = ""
    var body: some View {
        VStack{
            Text("اختار الايموجي اللي يعبر عنك اليوم ")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
            ZStack{
                Text(emoji)
                    .font(.largeTitle)
                    .blur(radius: 10)
                Text(emoji)
                    .font(.largeTitle)
                    
            }
               
                
            
            ScrollView(.horizontal){
            HStack{
                ForEach(emojies,id:\.self){emojy in
                    ZStack{
//                        Circle()
//                         //   .frame(width: 60, height: 60)
//                            .foregroundColor(.gray)
//                            .blur(radius: 10)
                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color(
                                    red: 0xF5 / 255,
                                    green: 0xF5 / 255,
                                    blue:  0xDC / 255
                                   ))
                        Text(emojy)
                            .font(.largeTitle)
                
                            } .onTapGesture {
                                    emoji = "\(emojy)"
                                    }
                    }
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
