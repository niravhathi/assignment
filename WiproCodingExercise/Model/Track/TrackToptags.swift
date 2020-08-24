
import Foundation
struct ToptagsTrack : Codable {
	let tag : [TagTrack]?

	enum CodingKeys: String, CodingKey {

		case tag = "tag"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		tag = try values.decodeIfPresent([TagTrack].self, forKey: .tag)
	}

}
