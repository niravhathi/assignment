/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ArtistModel : Codable {
	let name : String?
	let mbid : String?
	let url : String?
	let image : [ImageArtist]?
	let streamable : String?
	let ontour : String?
	let stats : StatsArtist?
	let similar : SimilarArtist?
	let tags : TagsArtist?
	let bio : BioArtist?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case mbid = "mbid"
		case url = "url"
		case image = "image"
		case streamable = "streamable"
		case ontour = "ontour"
		case stats = "stats"
		case similar = "similar"
		case tags = "tags"
		case bio = "bio"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		mbid = try values.decodeIfPresent(String.self, forKey: .mbid)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		image = try values.decodeIfPresent([ImageArtist].self, forKey: .image)
		streamable = try values.decodeIfPresent(String.self, forKey: .streamable)
		ontour = try values.decodeIfPresent(String.self, forKey: .ontour)
		stats = try values.decodeIfPresent(StatsArtist.self, forKey: .stats)
		similar = try values.decodeIfPresent(SimilarArtist.self, forKey: .similar)
		tags = try values.decodeIfPresent(TagsArtist.self, forKey: .tags)
		bio = try values.decodeIfPresent(BioArtist.self, forKey: .bio)
	}

}
