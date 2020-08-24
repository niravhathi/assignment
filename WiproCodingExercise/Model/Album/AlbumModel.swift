/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct AlbumModel : Codable {
	let name : String?
	let artist : String?
	let mbid : String?
	let url : String?
	let image : [ImageAlbum]?
	let listeners : String?
	let playcount : String?
	let tracks : TracksAlbum?
	let tags : TagsAlbum?
	let wiki : WikiAlbum?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case artist = "artist"
		case mbid = "mbid"
		case url = "url"
		case image = "image"
		case listeners = "listeners"
		case playcount = "playcount"
		case tracks = "tracks"
		case tags = "tags"
		case wiki = "wiki"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		artist = try values.decodeIfPresent(String.self, forKey: .artist)
		mbid = try values.decodeIfPresent(String.self, forKey: .mbid)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		image = try values.decodeIfPresent([ImageAlbum].self, forKey: .image)
		listeners = try values.decodeIfPresent(String.self, forKey: .listeners)
		playcount = try values.decodeIfPresent(String.self, forKey: .playcount)
		tracks = try values.decodeIfPresent(TracksAlbum.self, forKey: .tracks)
		tags = try values.decodeIfPresent(TagsAlbum.self, forKey: .tags)
		wiki = try values.decodeIfPresent(WikiAlbum.self, forKey: .wiki)
	}

}
