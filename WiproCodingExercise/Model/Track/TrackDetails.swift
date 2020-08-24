

import Foundation
struct TrackDetails : Codable {
	let track : TrackModel?

	enum CodingKeys: String, CodingKey {

		case track = "track"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		track = try values.decodeIfPresent(TrackModel.self, forKey: .track)
	}

}
