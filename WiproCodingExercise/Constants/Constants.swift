//
//  Constants.swift
//  WiproCodingExercise
//
//  Created by Nirav Hathi on 8/19/20.
//  Copyright © 2020 Nirav Hathi. All rights reserved.
//

import UIKit


/// API URL
let apiURL = "http://ws.audioscrobbler.com"
let apiImageURL = "https://lastfm.freetls.fastly.net/i/u/"
let endPointURL = "/2.0/?"
let apiKey = "api_key"
let apiKeyValue = "424d92721e510ef6e619278215313bc3"
let pageNumberKey = "page"
let formatKey = "format"
let methodKey =  "method"
let mbidKey = "mbid"
let keyWindow = UIApplication.shared.connectedScenes
    .filter({$0.activationState == .foregroundActive})
    .map({$0 as? UIWindowScene})
    .compactMap({$0})
    .first?.windows
    .filter({$0.isKeyWindow}).first
enum SearchTerm: String, CaseIterable {
    case album = "Album"
    case track = "Track"
    case artist = "Artist"
}

struct SegueConstants {
    static let showDetailViewController = "ShowDetailViewController"
}

enum CellType {
    case name
    case bio
    case list
    case tag
    case artist
    case date
    case publish
    case content
}
