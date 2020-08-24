

import Foundation
struct TrackModel : Codable {
	let name : String?
	let mbid : String?
	let url : String?
	let duration : String?
	let streamable : StreamableTrack?
	let listeners : String?
	let playcount : String?
	let artist : ArtistTrack?
	let album : AlbumTrack?
	let toptags : ToptagsTrack?
	let wiki : WikiTrack?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case mbid = "mbid"
		case url = "url"
		case duration = "duration"
		case streamable = "streamable"
		case listeners = "listeners"
		case playcount = "playcount"
		case artist = "artist"
		case album = "album"
		case toptags = "toptags"
		case wiki = "wiki"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		mbid = try values.decodeIfPresent(String.self, forKey: .mbid)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		duration = try values.decodeIfPresent(String.self, forKey: .duration)
		streamable = try values.decodeIfPresent(StreamableTrack.self, forKey: .streamable)
		listeners = try values.decodeIfPresent(String.self, forKey: .listeners)
		playcount = try values.decodeIfPresent(String.self, forKey: .playcount)
		artist = try values.decodeIfPresent(ArtistTrack.self, forKey: .artist)
		album = try values.decodeIfPresent(AlbumTrack.self, forKey: .album)
		toptags = try values.decodeIfPresent(ToptagsTrack.self, forKey: .toptags)
		wiki = try values.decodeIfPresent(WikiTrack.self, forKey: .wiki)
	}

}
