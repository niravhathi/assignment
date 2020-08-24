

import Foundation
struct ImageTrack : Codable {
	let textString : String?
	let size : String?

	enum CodingKeys: String, CodingKey {

		case textString = "#text"
		case size = "size"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		textString = try values.decodeIfPresent(String.self, forKey: .textString)
		size = try values.decodeIfPresent(String.self, forKey: .size)
	}

}
