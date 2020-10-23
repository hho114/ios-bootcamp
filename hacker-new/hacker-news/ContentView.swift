//
//  ContentView.swift
//  hacker-news
//
//  Created by Alex Ho on 10/9/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts){ post in
                Text(post.title)
                
            }
            .navigationBarTitle("H4XER news")
        }.onAppear{
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct Post:Identifiable {
//    let id: String
//    let title: String
//}
//
//let posts = [
//
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Bonjour"),
//    Post(id: "3", title: "Hola")
//
//]

