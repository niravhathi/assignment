
import Foundation
struct StreamableTrack : Codable {
	let textString : String?
	let fulltrack : String?

	enum CodingKeys: String, CodingKey {

		case textString = "#text"
		case fulltrack = "fulltrack"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		textString = try values.decodeIfPresent(String.self, forKey: .textString)
		fulltrack = try values.decodeIfPresent(String.self, forKey: .fulltrack)
	}

}
