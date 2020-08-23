//
//  ArtistDetails.swift
//  WiproCodingExercise
//
//  Created by Nirav Hathi on 8/20/20.
//  Copyright © 2020 Nirav Hathi. All rights reserved.
//

import Foundation

// MARK: - ArtistDetails
class ArtistDetails: Codable {
    let artist: ArtistDetailsArtist?

    init(artist: ArtistDetailsArtist?) {
        self.artist = artist
    }
}

// MARK: ArtistDetails convenience initializers and mutators

extension ArtistDetails {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(ArtistDetails.self, from: data)
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
        artist: ArtistDetailsArtist?? = nil
    ) -> ArtistDetails {
        return ArtistDetails(
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

// MARK: - ArtistDetailsArtist
class ArtistDetailsArtist: Codable {
    let name, mbid: String?
    let url: String?
    let image: [Image]?
    let streamable, ontour: String?
    let stats: Stats?
    let similar: Similar?
    let tags: Tags?
    let bio: Bio?

    init(name: String?, mbid: String?, url: String?, image: [Image]?, streamable: String?, ontour: String?, stats: Stats?, similar: Similar?, tags: Tags?, bio: Bio?) {
        self.name = name
        self.mbid = mbid
        self.url = url
        self.image = image
        self.streamable = streamable
        self.ontour = ontour
        self.stats = stats
        self.similar = similar
        self.tags = tags
        self.bio = bio
    }
}

// MARK: ArtistDetailsArtist convenience initializers and mutators

extension ArtistDetailsArtist {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(ArtistDetailsArtist.self, from: data)
        self.init(name: me.name, mbid: me.mbid, url: me.url, image: me.image, streamable: me.streamable, ontour: me.ontour, stats: me.stats, similar: me.similar, tags: me.tags, bio: me.bio)
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
        mbid: String?? = nil,
        url: String?? = nil,
        image: [Image]?? = nil,
        streamable: String?? = nil,
        ontour: String?? = nil,
        stats: Stats?? = nil,
        similar: Similar?? = nil,
        tags: Tags?? = nil,
        bio: Bio?? = nil
    ) -> ArtistDetailsArtist {
        return ArtistDetailsArtist(
            name: name ?? self.name,
            mbid: mbid ?? self.mbid,
            url: url ?? self.url,
            image: image ?? self.image,
            streamable: streamable ?? self.streamable,
            ontour: ontour ?? self.ontour,
            stats: stats ?? self.stats,
            similar: similar ?? self.similar,
            tags: tags ?? self.tags,
            bio: bio ?? self.bio
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Bio
class Bio: Codable {
    let links: Links?
    let published, summary, content: String?

    init(links: Links?, published: String?, summary: String?, content: String?) {
        self.links = links
        self.published = published
        self.summary = summary
        self.content = content
    }
}

// MARK: Bio convenience initializers and mutators

extension Bio {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Bio.self, from: data)
        self.init(links: me.links, published: me.published, summary: me.summary, content: me.content)
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
        links: Links?? = nil,
        published: String?? = nil,
        summary: String?? = nil,
        content: String?? = nil
    ) -> Bio {
        return Bio(
            links: links ?? self.links,
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

// MARK: - Links
class Links: Codable {
    let link: Link?

    init(link: Link?) {
        self.link = link
    }
}

// MARK: Links convenience initializers and mutators

extension Links {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Links.self, from: data)
        self.init(link: me.link)
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
        link: Link?? = nil
    ) -> Links {
        return Links(
            link: link ?? self.link
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Link
class Link: Codable {
    let text, rel: String?
    let href: String?

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case rel, href
    }

    init(text: String?, rel: String?, href: String?) {
        self.text = text
        self.rel = rel
        self.href = href
    }
}

// MARK: Link convenience initializers and mutators

extension Link {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Link.self, from: data)
        self.init(text: me.text, rel: me.rel, href: me.href)
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
        rel: String?? = nil,
        href: String?? = nil
    ) -> Link {
        return Link(
            text: text ?? self.text,
            rel: rel ?? self.rel,
            href: href ?? self.href
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Similar
class Similar: Codable {
    let artist: [ArtistElement]?

    init(artist: [ArtistElement]?) {
        self.artist = artist
    }
}

// MARK: Similar convenience initializers and mutators

extension Similar {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Similar.self, from: data)
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
        artist: [ArtistElement]?? = nil
    ) -> Similar {
        return Similar(
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

// MARK: - ArtistElement
class ArtistElement: Codable {
    let name: String?
    let url: String?
    let image: [Image]?

    init(name: String?, url: String?, image: [Image]?) {
        self.name = name
        self.url = url
        self.image = image
    }
}

// MARK: ArtistElement convenience initializers and mutators

extension ArtistElement {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(ArtistElement.self, from: data)
        self.init(name: me.name, url: me.url, image: me.image)
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
        image: [Image]?? = nil
    ) -> ArtistElement {
        return ArtistElement(
            name: name ?? self.name,
            url: url ?? self.url,
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

// MARK: - Stats
class Stats: Codable {
    let listeners, playcount: String?

    init(listeners: String?, playcount: String?) {
        self.listeners = listeners
        self.playcount = playcount
    }
}

// MARK: Stats convenience initializers and mutators

extension Stats {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Stats.self, from: data)
        self.init(listeners: me.listeners, playcount: me.playcount)
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
        listeners: String?? = nil,
        playcount: String?? = nil
    ) -> Stats {
        return Stats(
            listeners: listeners ?? self.listeners,
            playcount: playcount ?? self.playcount
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}


// MARK: - Tags
class Tags: Codable {
    let tag: [Tag]?

    init(tag: [Tag]?) {
        self.tag = tag
    }
}

// MARK: Tags convenience initializers and mutators

extension Tags {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Tags.self, from: data)
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
        tag: [Tag]?? = nil
    ) -> Tags {
        return Tags(
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

