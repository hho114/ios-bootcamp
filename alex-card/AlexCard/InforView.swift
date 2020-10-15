//
//  InforView.swift
//  AlexCard
//
//  Created by Alex Ho on 10/9/20.
//

import SwiftUI

struct InforView: View {
    let text: String
    let imageName: String
    var body: some View {
        RoundedRectangle(cornerRadius: 20).fill(Color.white).frame( height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(.white).overlay(HStack {
            Image(systemName: imageName).foregroundColor(.green)
            Text(text).foregroundColor(.black)
        }).padding()
    }
}

struct InforView_Previews: PreviewProvider {
    static var previews: some View {
        InforView(text:"Hello", imageName:"phone.fill").previewLayout(.sizeThatFits)
    }
}
