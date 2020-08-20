//
//  Tracks.swift
//  WiproCodingExercise
//
//  Created by Nirav Hathi on 8/20/20.
//  Copyright © 2020 Nirav Hathi. All rights reserved.
//

import Foundation

// MARK: - Tracks
class Tracks: Codable {
    let results: TracksResults?

    init(results: TracksResults?) {
        self.results = results
    }
}

// MARK: Tracks convenience initializers and mutators

extension Tracks {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Tracks.self, from: data)
        self.init(results: me.results)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        results: TracksResults?? = nil
    ) -> Tracks {
        return Tracks(
            results: results ?? self.results
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Results
class TracksResults: Codable {
    let opensearchQuery: OpensearchQuery?
    let opensearchTotalResults, opensearchStartIndex, opensearchItemsPerPage: String?
    let trackmatches: Trackmatches?
    let attr: Attr?

    enum CodingKeys: String, CodingKey {
        case opensearchQuery = "opensearch:Query"
        case opensearchTotalResults = "opensearch:totalResults"
        case opensearchStartIndex = "opensearch:startIndex"
        case opensearchItemsPerPage = "opensearch:itemsPerPage"
        case trackmatches
        case attr = "@attr"
    }

    init(opensearchQuery: OpensearchQuery?, opensearchTotalResults: String?, opensearchStartIndex: String?, opensearchItemsPerPage: String?, trackmatches: Trackmatches?, attr: Attr?) {
        self.opensearchQuery = opensearchQuery
        self.opensearchTotalResults = opensearchTotalResults
        self.opensearchStartIndex = opensearchStartIndex
        self.opensearchItemsPerPage = opensearchItemsPerPage
        self.trackmatches = trackmatches
        self.attr = attr
    }
}

// MARK: Results convenience initializers and mutators

extension TracksResults {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(TracksResults.self, from: data)
        self.init(opensearchQuery: me.opensearchQuery, opensearchTotalResults: me.opensearchTotalResults, opensearchStartIndex: me.opensearchStartIndex, opensearchItemsPerPage: me.opensearchItemsPerPage, trackmatches: me.trackmatches, attr: me.attr)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        opensearchQuery: OpensearchQuery?? = nil,
        opensearchTotalResults: String?? = nil,
        opensearchStartIndex: String?? = nil,
        opensearchItemsPerPage: String?? = nil,
        trackmatches: Trackmatches?? = nil,
        attr: Attr?? = nil
    ) -> TracksResults {
        return TracksResults(
            opensearchQuery: opensearchQuery ?? self.opensearchQuery,
            opensearchTotalResults: opensearchTotalResults ?? self.opensearchTotalResults,
            opensearchStartIndex: opensearchStartIndex ?? self.opensearchStartIndex,
            opensearchItemsPerPage: opensearchItemsPerPage ?? self.opensearchItemsPerPage,
            trackmatches: trackmatches ?? self.trackmatches,
            attr: attr ?? self.attr
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
// MARK: - Trackmatches
class Trackmatches: Codable {
    let track: [Track]?

    init(track: [Track]?) {
        self.track = track
    }
}

// MARK: Trackmatches convenience initializers and mutators

extension Trackmatches {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Trackmatches.self, from: data)
        self.init(track: me.track)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        track: [Track]?? = nil
    ) -> Trackmatches {
        return Trackmatches(
            track: track ?? self.track
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Track
class Track: Codable {
    let name, artist: String?
    let url: String?
    let streamable: Streamable?
    let listeners: String?
    let image: [Image]?
    let mbid: String?

    init(name: String?, artist: String?, url: String?, streamable: Streamable?, listeners: String?, image: [Image]?, mbid: String?) {
        self.name = name
        self.artist = artist
        self.url = url
        self.streamable = streamable
        self.listeners = listeners
        self.image = image
        self.mbid = mbid
    }
}

// MARK: Track convenience initializers and mutators

extension Track {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Track.self, from: data)
        self.init(name: me.name, artist: me.artist, url: me.url, streamable: me.streamable, listeners: me.listeners, image: me.image, mbid: me.mbid)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        name: String?? = nil,
        artist: String?? = nil,
        url: String?? = nil,
        streamable: Streamable?? = nil,
        listeners: String?? = nil,
        image: [Image]?? = nil,
        mbid: String?? = nil
    ) -> Track {
        return Track(
            name: name ?? self.name,
            artist: artist ?? self.artist,
            url: url ?? self.url,
            streamable: streamable ?? self.streamable,
            listeners: listeners ?? self.listeners,
            image: image ?? self.image,
            mbid: mbid ?? self.mbid
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
enum Streamable: String, Codable {
    case fixme = "FIXME"
}


