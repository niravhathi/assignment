//
//  Albums.swift
//  WiproCodingExercise
//
//  Created by Nirav Hathi on 8/20/20.
//  Copyright © 2020 Nirav Hathi. All rights reserved.
//

import Foundation

// MARK: - Albums
class Albums: Codable {
    let results: AlbumsResults?

    init(results: AlbumsResults?) {
        self.results = results
    }
}

// MARK: Albums convenience initializers and mutators

extension Albums {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Albums.self, from: data)
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
        results: AlbumsResults?? = nil
    ) -> Albums {
        return Albums(
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
class AlbumsResults: Codable {
    let opensearchQuery: OpensearchQuery?
    let opensearchTotalResults, opensearchStartIndex, opensearchItemsPerPage: String?
    let albummatches: Albummatches?
    let attr: Attr?

    enum CodingKeys: String, CodingKey {
        case opensearchQuery = "opensearch:Query"
        case opensearchTotalResults = "opensearch:totalResults"
        case opensearchStartIndex = "opensearch:startIndex"
        case opensearchItemsPerPage = "opensearch:itemsPerPage"
        case albummatches
        case attr = "@attr"
    }

    init(opensearchQuery: OpensearchQuery?, opensearchTotalResults: String?, opensearchStartIndex: String?, opensearchItemsPerPage: String?, albummatches: Albummatches?, attr: Attr?) {
        self.opensearchQuery = opensearchQuery
        self.opensearchTotalResults = opensearchTotalResults
        self.opensearchStartIndex = opensearchStartIndex
        self.opensearchItemsPerPage = opensearchItemsPerPage
        self.albummatches = albummatches
        self.attr = attr
    }
}

// MARK: Results convenience initializers and mutators

extension AlbumsResults {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(AlbumsResults.self, from: data)
        self.init(opensearchQuery: me.opensearchQuery, opensearchTotalResults: me.opensearchTotalResults, opensearchStartIndex: me.opensearchStartIndex, opensearchItemsPerPage: me.opensearchItemsPerPage, albummatches: me.albummatches, attr: me.attr)
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
        albummatches: Albummatches?? = nil,
        attr: Attr?? = nil
    ) -> AlbumsResults {
        return AlbumsResults(
            opensearchQuery: opensearchQuery ?? self.opensearchQuery,
            opensearchTotalResults: opensearchTotalResults ?? self.opensearchTotalResults,
            opensearchStartIndex: opensearchStartIndex ?? self.opensearchStartIndex,
            opensearchItemsPerPage: opensearchItemsPerPage ?? self.opensearchItemsPerPage,
            albummatches: albummatches ?? self.albummatches,
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

// MARK: - Albummatches
class Albummatches: Codable {
    let album: [Album]?

    init(album: [Album]?) {
        self.album = album
    }
}

// MARK: Albummatches convenience initializers and mutators

extension Albummatches {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Albummatches.self, from: data)
        self.init(album: me.album)
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
        album: [Album]?? = nil
    ) -> Albummatches {
        return Albummatches(
            album: album ?? self.album
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Album
class Album: Codable {
    let name, artist: String?
    let url: String?
    let image: [Image]?
    let streamable, mbid: String?

    init(name: String?, artist: String?, url: String?, image: [Image]?, streamable: String?, mbid: String?) {
        self.name = name
        self.artist = artist
        self.url = url
        self.image = image
        self.streamable = streamable
        self.mbid = mbid
    }
}

// MARK: Album convenience initializers and mutators

extension Album {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Album.self, from: data)
        self.init(name: me.name, artist: me.artist, url: me.url, image: me.image, streamable: me.streamable, mbid: me.mbid)
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
        image: [Image]?? = nil,
        streamable: String?? = nil,
        mbid: String?? = nil
    ) -> Album {
        return Album(
            name: name ?? self.name,
            artist: artist ?? self.artist,
            url: url ?? self.url,
            image: image ?? self.image,
            streamable: streamable ?? self.streamable,
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

