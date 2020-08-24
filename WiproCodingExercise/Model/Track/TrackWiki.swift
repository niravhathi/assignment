

import Foundation
struct WikiTrack : Codable {
	let published : String?
	let summary : String?
	let content : String?

	enum CodingKeys: String, CodingKey {

		case published = "published"
		case summary = "summary"
		case content = "content"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		published = try values.decodeIfPresent(String.self, forKey: .published)
		summary = try values.decodeIfPresent(String.self, forKey: .summary)
		content = try values.decodeIfPresent(String.self, forKey: .content)
	}

}
