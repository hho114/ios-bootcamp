//
//  PostData.swift
//  hacker-news
//
//  Created by Alex Ho on 10/9/20.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
   
}

struct Post: Decodable, Identifiable {
    
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
