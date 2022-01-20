//
//  SearchResponce.swift
//  itunesParseJsonAplication
//
//  Created by Fedii Ihor on 18.01.2022.
//

import Foundation

struct SearchResponce: Codable {
    var resultCount:Int
     var results: [Track]
}

struct Track: Codable {
    var wrapperType: String
    //var kind: String
    var artistId: Int?
    var collectionId: Int?
    var trackId: Int?
    var artistName: String
    var collectionName: String?
    var trackName: String
    var trackCensoredName: String
    var artistViewUrl: String?
    var trackViewUrl:String
    var previewUrl:String
    var artworkUrl30:String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var collectionPrice: Double
    var trackPrice: Double
    var releaseDate: String
    var collectionExplicitness: String
    var trackExplicitness: String
    var trackTimeMillis: Int
    var country: String
    var currency: String
    var primaryGenreName: String
    
}
