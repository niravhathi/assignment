

import Foundation

// MARK: - TrackDetails
class TrackDetails: Codable {
    let track: TrackModel?

    init(track: TrackModel?) {
        self.track = track
    }
}

// MARK: TrackDetails convenience initializers and mutators

extension TrackDetails {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(TrackDetails.self, from: data)
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
        track: TrackModel?? = nil
    ) -> TrackDetails {
        return TrackDetails(
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
class TrackModel: Codable {
    let name, mbid: String?
    let url: String?
    let duration: String?
    let streamable: TrackStreamable?
    let listeners, playcount: String?
    let artist: TrackArtist?
    let album: TrackAlbum?
    let toptags: Toptags?
    let wiki: Wiki?

    init(name: String?, mbid: String?, url: String?, duration: String?, streamable: TrackStreamable?, listeners: String?, playcount: String?, artist: TrackArtist?, album: TrackAlbum?, toptags: Toptags?, wiki: Wiki?) {
        self.name = name
        self.mbid = mbid
        self.url = url
        self.duration = duration
        self.streamable = streamable
        self.listeners = listeners
        self.playcount = playcount
        self.artist = artist
        self.album = album
        self.toptags = toptags
        self.wiki = wiki
    }
}

// MARK: Track convenience initializers and mutators

extension TrackModel {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(TrackModel.self, from: data)
        self.init(name: me.name, mbid: me.mbid, url: me.url, duration: me.duration, streamable: me.streamable, listeners: me.listeners, playcount: me.playcount, artist: me.artist, album: me.album, toptags: me.toptags, wiki: me.wiki)
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
        duration: String?? = nil,
        streamable: TrackStreamable?? = nil,
        listeners: String?? = nil,
        playcount: String?? = nil,
        artist: TrackArtist?? = nil,
        album: TrackAlbum?? = nil,
        toptags: Toptags?? = nil,
        wiki: Wiki?? = nil
    ) -> TrackModel {
        return TrackModel(
            name: name ?? self.name,
            mbid: mbid ?? self.mbid,
            url: url ?? self.url,
            duration: duration ?? self.duration,
            streamable: streamable ?? self.streamable,
            listeners: listeners ?? self.listeners,
            playcount: playcount ?? self.playcount,
            artist: artist ?? self.artist,
            album: album ?? self.album,
            toptags: toptags ?? self.toptags,
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

// MARK: - Album
class TrackAlbum: Codable {
    let artist, title, mbid: String?
    let url: String?
    let image: [Image]?
    let attr: TrackAttr?

    enum CodingKeys: String, CodingKey {
        case artist, title, mbid, url, image
        case attr = "@attr"
    }

    init(artist: String?, title: String?, mbid: String?, url: String?, image: [Image]?, attr: TrackAttr?) {
        self.artist = artist
        self.title = title
        self.mbid = mbid
        self.url = url
        self.image = image
        self.attr = attr
    }
}

// MARK: Album convenience initializers and mutators

extension TrackAlbum {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(TrackAlbum.self, from: data)
        self.init(artist: me.artist, title: me.title, mbid: me.mbid, url: me.url, image: me.image, attr: me.attr)
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
        artist: String?? = nil,
        title: String?? = nil,
        mbid: String?? = nil,
        url: String?? = nil,
        image: [Image]?? = nil,
        attr: TrackAttr?? = nil
    ) -> TrackAlbum {
        return TrackAlbum(
            artist: artist ?? self.artist,
            title: title ?? self.title,
            mbid: mbid ?? self.mbid,
            url: url ?? self.url,
            image: image ?? self.image,
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

// MARK: - Attr
class TrackAttr: Codable {
    let position: String?

    init(position: String?) {
        self.position = position
    }
}

// MARK: Attr convenience initializers and mutators

extension TrackAttr {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(TrackAttr.self, from: data)
        self.init(position: me.position)
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
        position: String?? = nil
    ) -> TrackAttr {
        return TrackAttr(
            position: position ?? self.position
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
class TrackImage: Codable {
    let text: String?
    let size: String?

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case size
    }

    init(text: String?, size: String?) {
        self.text = text
        self.size = size
    }
}

// MARK: Image convenience initializers and mutators

extension TrackImage {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(TrackImage.self, from: data)
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
        size: String?? = nil
    ) -> TrackImage {
        return TrackImage(
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

// MARK: - Artist
class TrackArtist: Codable {
    let name, mbid: String?
    let url: String?

    init(name: String?, mbid: String?, url: String?) {
        self.name = name
        self.mbid = mbid
        self.url = url
    }
}

// MARK: Artist convenience initializers and mutators

extension TrackArtist {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Artist.self, from: data)
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
        name: String?? = nil,
        mbid: String?? = nil,
        url: String?? = nil
    ) -> TrackArtist {
        return TrackArtist(
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

// MARK: - Streamable
class TrackStreamable: Codable {
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

extension TrackStreamable {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(TrackStreamable.self, from: data)
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
    ) -> TrackStreamable {
        return TrackStreamable(
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

// MARK: - Toptags
class Toptags: Codable {
    let tag: [Tag]?

    init(tag: [Tag]?) {
        self.tag = tag
    }
}

// MARK: Toptags convenience initializers and mutators

extension Toptags {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Toptags.self, from: data)
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
    ) -> Toptags {
        return Toptags(
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
class Tag: Codable {
    let name: String?
    let url: String?

    init(name: String?, url: String?) {
        self.name = name
        self.url = url
    }
}

// MARK: Tag convenience initializers and mutators

extension Tag {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Tag.self, from: data)
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

// MARK: - Wiki
class Wiki: Codable {
    let published, summary, content: String?

    init(published: String?, summary: String?, content: String?) {
        self.published = published
        self.summary = summary
        self.content = content
    }
}

// MARK: Wiki convenience initializers and mutators

extension Wiki {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Wiki.self, from: data)
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
    ) -> Wiki {
        return Wiki(
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
