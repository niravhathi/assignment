

import Foundation
struct AttrTrack : Codable {
	let position : String?

	enum CodingKeys: String, CodingKey {

		case position = "position"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		position = try values.decodeIfPresent(String.self, forKey: .position)
	}

}
