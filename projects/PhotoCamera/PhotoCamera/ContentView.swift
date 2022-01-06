//
//  ContentView.swift
//  PhotoCamera
//
//  Created by Tan Ren Jie on 2/11/20.
//

import SwiftUI

struct ContentView: View {
    @State var image: Image? = nil
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
//                    TODO: Add the action here
                }) {
                    Text("Choose photos")
                }
                image?.resizable()
                    .frame(width: 250, height: 250)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
