

import Foundation
struct ArtistTrack : Codable {
	let name : String?
	let mbid : String?
	let url : String?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case mbid = "mbid"
		case url = "url"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		mbid = try values.decodeIfPresent(String.self, forKey: .mbid)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}

}
