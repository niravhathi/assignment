//
//  AlbumDetails.swift
//  WiproCodingExercise
//
//  Created by Nirav Hathi on 8/20/20.
//  Copyright © 2020 Nirav Hathi. All rights reserved.
//

import Foundation

// MARK: - AlbumDetails
class AlbumDetails: Codable {
    let album: AlbumModel?

    init(album: AlbumModel?) {
        self.album = album
    }
}

// MARK: AlbumDetails convenience initializers and mutators

extension AlbumDetails {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(AlbumDetails.self, from: data)
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
        album: AlbumModel?? = nil
    ) -> AlbumDetails {
        return AlbumDetails(
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
class AlbumModel: Codable {
    let name: String?
    let artist: ArtistEnum?
    let mbid: String?
    let url: String?
    let image: [Image]?
    let listeners, playcount: String?
    let tracks: AlbumTracks?
    let tags: AlbumTags?
    let wiki: AlbumWiki?

    init(name: String?, artist: ArtistEnum?, mbid: String?, url: String?, image: [Image]?, listeners: String?, playcount: String?, tracks: AlbumTracks?, tags: AlbumTags?, wiki: AlbumWiki?) {
        self.name = name
        self.artist = artist
        self.mbid = mbid
        self.url = url
        self.image = image
        self.listeners = listeners
        self.playcount = playcount
        self.tracks = tracks
        self.tags = tags
        self.wiki = wiki
    }
}

// MARK: Album convenience initializers and mutators

extension AlbumModel {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(AlbumModel.self, from: data)
        self.init(name: me.name, artist: me.artist, mbid: me.mbid, url: me.url, image: me.image, listeners: me.listeners, playcount: me.playcount, tracks: me.tracks, tags: me.tags, wiki: me.wiki)
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
        artist: ArtistEnum?? = nil,
        mbid: String?? = nil,
        url: String?? = nil,
        image: [Image]?? = nil,
        listeners: String?? = nil,
        playcount: String?? = nil,
        tracks: AlbumTracks?? = nil,
        tags: AlbumTags?? = nil,
        wiki: AlbumWiki?? = nil
    ) -> AlbumModel {
        return AlbumModel(
            name: name ?? self.name,
            artist: artist ?? self.artist,
            mbid: mbid ?? self.mbid,
            url: url ?? self.url,
            image: image ?? self.image,
            listeners: listeners ?? self.listeners,
            playcount: playcount ?? self.playcount,
            tracks: tracks ?? self.tracks,
            tags: tags ?? self.tags,
            wiki: wiki ?? self.wiki
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum ArtistEnum: String, Codable {
    case cher = "Cher"
}
// MARK: - Tags
class AlbumTags: Codable {
    let tag: [AlbumTag]?

    init(tag: [AlbumTag]?) {
        self.tag = tag
    }
}

// MARK: Tags convenience initializers and mutators

extension AlbumTags {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(AlbumTags.self, from: data)
        self.init(tag: me.tag)
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
        tag: [AlbumTag]?? = nil
    ) -> AlbumTags {
        return AlbumTags(
            tag: tag ?? self.tag
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Tag
class AlbumTag: Codable {
    let name: String?
    let url: String?

    init(name: String?, url: String?) {
        self.name = name
        self.url = url
    }
}

// MARK: Tag convenience initializers and mutators

extension AlbumTag {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(AlbumTag.self, from: data)
        self.init(name: me.name, url: me.url)
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
        url: String?? = nil
    ) -> Tag {
        return Tag(
            name: name ?? self.name,
            url: url ?? self.url
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Tracks
class AlbumTracks: Codable {
    let track: [AlbumTrack]?

    init(track: [AlbumTrack]?) {
        self.track = track
    }
}

// MARK: Tracks convenience initializers and mutators

extension AlbumTracks {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(AlbumTracks.self, from: data)
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
        track: [AlbumTrack]?? = nil
    ) -> AlbumTracks {
        return AlbumTracks(
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
class AlbumTrack: Codable {
    let name: String?
    let url: String?
    let duration: String?
    let attr: AlbumAttr?
    let streamable: AlbumStreamable?
    let artist: ArtistClass?

    enum CodingKeys: String, CodingKey {
        case name, url, duration
        case attr = "@attr"
        case streamable, artist
    }

    init(name: String?, url: String?, duration: String?, attr: AlbumAttr?, streamable: AlbumStreamable?, artist: ArtistClass?) {
        self.name = name
        self.url = url
        self.duration = duration
        self.attr = attr
        self.streamable = streamable
        self.artist = artist
    }
}

// MARK: Track convenience initializers and mutators

extension AlbumTrack {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(AlbumTrack.self, from: data)
        self.init(name: me.name, url: me.url, duration: me.duration, attr: me.attr, streamable: me.streamable, artist: me.artist)
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
        url: String?? = nil,
        duration: String?? = nil,
        attr: AlbumAttr?? = nil,
        streamable: AlbumStreamable?? = nil,
        artist: ArtistClass?? = nil
    ) -> AlbumTrack {
        return AlbumTrack(
            name: name ?? self.name,
            url: url ?? self.url,
            duration: duration ?? self.duration,
            attr: attr ?? self.attr,
            streamable: streamable ?? self.streamable,
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

// MARK: - ArtistClass
class ArtistClass: Codable {
    let name: ArtistEnum?
    let mbid: String?
    let url: String?

    init(name: ArtistEnum?, mbid: String?, url: String?) {
        self.name = name
        self.mbid = mbid
        self.url = url
    }
}

// MARK: ArtistClass convenience initializers and mutators

extension ArtistClass {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(ArtistClass.self, from: data)
        self.init(name: me.name, mbid: me.mbid, url: me.url)
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
        name: ArtistEnum?? = nil,
        mbid: String?? = nil,
        url: String?? = nil
    ) -> ArtistClass {
        return ArtistClass(
            name: name ?? self.name,
            mbid: mbid ?? self.mbid,
            url: url ?? self.url
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Attr
class AlbumAttr: Codable {
    let rank: String?

    init(rank: String?) {
        self.rank = rank
    }
}

// MARK: Attr convenience initializers and mutators

extension AlbumAttr {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(AlbumAttr.self, from: data)
        self.init(rank: me.rank)
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
        rank: String?? = nil
    ) -> AlbumAttr {
        return AlbumAttr(
            rank: rank ?? self.rank
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Streamable
class AlbumStreamable: Codable {
    let text, fulltrack: String?

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case fulltrack
    }

    init(text: String?, fulltrack: String?) {
        self.text = text
        self.fulltrack = fulltrack
    }
}

// MARK: Streamable convenience initializers and mutators

extension AlbumStreamable {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(AlbumStreamable.self, from: data)
        self.init(text: me.text, fulltrack: me.fulltrack)
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
        fulltrack: String?? = nil
    ) -> AlbumStreamable {
        return AlbumStreamable(
            text: text ?? self.text,
            fulltrack: fulltrack ?? self.fulltrack
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Wiki
class AlbumWiki: Codable {
    let published, summary, content: String?

    init(published: String?, summary: String?, content: String?) {
        self.published = published
        self.summary = summary
        self.content = content
    }
}

// MARK: Wiki convenience initializers and mutators

extension AlbumWiki {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(AlbumWiki.self, from: data)
        self.init(published: me.published, summary: me.summary, content: me.content)
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
        published: String?? = nil,
        summary: String?? = nil,
        content: String?? = nil
    ) -> AlbumWiki {
        return AlbumWiki(
            published: published ?? self.published,
            summary: summary ?? self.summary,
            content: content ?? self.content
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

