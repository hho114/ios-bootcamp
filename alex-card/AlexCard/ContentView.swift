//
//  ContentView.swift
//  AlexCard
//
//  Created by Alex Ho on 10/9/20.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack{
            Color(red: 0.09, green: 0.63, blue: 0.52).edgesIgnoringSafeArea(.all)
            VStack{
                Image("avatar").resizable().aspectRatio(contentMode: .fit).frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(Color.white,lineWidth: 5))
                Text("Alex Ho").font(Font.custom("Pacifico-Regular", size: 40)).bold().foregroundColor(.white)
                
                Text("iOS, Flutter, Nodejs Developer").foregroundColor(.white).font(.system(size: 25))
                Divider()
                InforView(text: "+17144655596", imageName: "phone.fill")
                InforView(text: "huyho114@gmail.com", imageName: "envelope.fill")
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


