
import Foundation

struct AlbumTrack : Codable {
	let artist : String?
	let title : String?
	let mbid : String?
	let url : String?
	let image : [ImageTrack]?
	let attr : AttrTrack?

	enum CodingKeys: String, CodingKey {

		case artist = "artist"
		case title = "title"
		case mbid = "mbid"
		case url = "url"
		case image = "image"
		case attr = "@attr"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		artist = try values.decodeIfPresent(String.self, forKey: .artist)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		mbid = try values.decodeIfPresent(String.self, forKey: .mbid)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		image = try values.decodeIfPresent([ImageTrack].self, forKey: .image)
		attr = try values.decodeIfPresent(AttrTrack.self, forKey: .attr)
	}

}
