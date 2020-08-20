//
//  Artists.swift
//  WiproCodingExercise
//
//  Created by Nirav Hathi on 8/19/20.
//  Copyright © 2020 Nirav Hathi. All rights reserved.
//

import Foundation

// MARK: - Artists
class Artists: Codable {
    let results: ArtistsResults?

    init(results: ArtistsResults?) {
        self.results = results
    }
}

// MARK: Artists convenience initializers and mutators

extension Artists {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Artists.self, from: data)
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
        results: ArtistsResults?? = nil
    ) -> Artists {
        return Artists(
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
class ArtistsResults: Codable {
    let opensearchQuery: OpensearchQuery?
    let opensearchTotalResults, opensearchStartIndex, opensearchItemsPerPage: String?
    let artistmatches: Artistmatches?
    let attr: Attr?

    enum CodingKeys: String, CodingKey {
        case opensearchQuery = "opensearch:Query"
        case opensearchTotalResults = "opensearch:totalResults"
        case opensearchStartIndex = "opensearch:startIndex"
        case opensearchItemsPerPage = "opensearch:itemsPerPage"
        case artistmatches
        case attr = "@attr"
    }

    init(opensearchQuery: OpensearchQuery?, opensearchTotalResults: String?, opensearchStartIndex: String?, opensearchItemsPerPage: String?, artistmatches: Artistmatches?, attr: Attr?) {
        self.opensearchQuery = opensearchQuery
        self.opensearchTotalResults = opensearchTotalResults
        self.opensearchStartIndex = opensearchStartIndex
        self.opensearchItemsPerPage = opensearchItemsPerPage
        self.artistmatches = artistmatches
        self.attr = attr
    }
}

// MARK: Results convenience initializers and mutators

extension ArtistsResults {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(ArtistsResults.self, from: data)
        self.init(opensearchQuery: me.opensearchQuery, opensearchTotalResults: me.opensearchTotalResults, opensearchStartIndex: me.opensearchStartIndex, opensearchItemsPerPage: me.opensearchItemsPerPage, artistmatches: me.artistmatches, attr: me.attr)
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
        artistmatches: Artistmatches?? = nil,
        attr: Attr?? = nil
    ) -> ArtistsResults {
        return ArtistsResults(
            opensearchQuery: opensearchQuery ?? self.opensearchQuery,
            opensearchTotalResults: opensearchTotalResults ?? self.opensearchTotalResults,
            opensearchStartIndex: opensearchStartIndex ?? self.opensearchStartIndex,
            opensearchItemsPerPage: opensearchItemsPerPage ?? self.opensearchItemsPerPage,
            artistmatches: artistmatches ?? self.artistmatches,
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

// MARK: - Artistmatches
class Artistmatches: Codable {
    let artist: [Artist]?

    init(artist: [Artist]?) {
        self.artist = artist
    }
}

// MARK: Artistmatches convenience initializers and mutators

extension Artistmatches {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Artistmatches.self, from: data)
        self.init(artist: me.artist)
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
        artist: [Artist]?? = nil
    ) -> Artistmatches {
        return Artistmatches(
            artist: artist ?? self.artist
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Artist
class Artist: Codable {
    let name, listeners, mbid: String?
    let url: String?
    let streamable: String?
    let image: [Image]?

    init(name: String?, listeners: String?, mbid: String?, url: String?, streamable: String?, image: [Image]?) {
        self.name = name
        self.listeners = listeners
        self.mbid = mbid
        self.url = url
        self.streamable = streamable
        self.image = image
    }
}

// MARK: Artist convenience initializers and mutators

extension Artist {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Artist.self, from: data)
        self.init(name: me.name, listeners: me.listeners, mbid: me.mbid, url: me.url, streamable: me.streamable, image: me.image)
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
        listeners: String?? = nil,
        mbid: String?? = nil,
        url: String?? = nil,
        streamable: String?? = nil,
        image: [Image]?? = nil
    ) -> Artist {
        return Artist(
            name: name ?? self.name,
            listeners: listeners ?? self.listeners,
            mbid: mbid ?? self.mbid,
            url: url ?? self.url,
            streamable: streamable ?? self.streamable,
            image: image ?? self.image
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Image
class Image: Codable {
    let text: String?
    let size: Size?

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case size
    }

    init(text: String?, size: Size?) {
        self.text = text
        self.size = size
    }
}

// MARK: Image convenience initializers and mutators

extension Image {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Image.self, from: data)
        self.init(text: me.text, size: me.size)
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
        text: String?? = nil,
        size: Size?? = nil
    ) -> Image {
        return Image(
            text: text ?? self.text,
            size: size ?? self.size
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Size: String, Codable {
    case extralarge = "extralarge"
    case large = "large"
    case medium = "medium"
    case mega = "mega"
    case small = "small"
}

// MARK: - Attr
class Attr: Codable {
    let attrFor: String?

    enum CodingKeys: String, CodingKey {
        case attrFor = "for"
    }

    init(attrFor: String?) {
        self.attrFor = attrFor
    }
}

// MARK: Attr convenience initializers and mutators

extension Attr {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Attr.self, from: data)
        self.init(attrFor: me.attrFor)
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
        attrFor: String?? = nil
    ) -> Attr {
        return Attr(
            attrFor: attrFor ?? self.attrFor
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - OpensearchQuery
class OpensearchQuery: Codable {
    let text, role, searchTerms, startPage: String?

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case role, searchTerms, startPage
    }

    init(text: String?, role: String?, searchTerms: String?, startPage: String?) {
        self.text = text
        self.role = role
        self.searchTerms = searchTerms
        self.startPage = startPage
    }
}

// MARK: OpensearchQuery convenience initializers and mutators

extension OpensearchQuery {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(OpensearchQuery.self, from: data)
        self.init(text: me.text, role: me.role, searchTerms: me.searchTerms, startPage: me.startPage)
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
        text: String?? = nil,
        role: String?? = nil,
        searchTerms: String?? = nil,
        startPage: String?? = nil
    ) -> OpensearchQuery {
        return OpensearchQuery(
            text: text ?? self.text,
            role: role ?? self.role,
            searchTerms: searchTerms ?? self.searchTerms,
            startPage: startPage ?? self.startPage
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

