//
//  Profile.swift
//  op131Lehi_iOS
//
//  Created by Michael Huber Jr on 3/12/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import UIKit
import Foundation

struct Profile {

    // MARK: - Properties

    var id: Int?

    var givenName: String
    var surname: String

    var username: String
    var password: String

    var imagePath: String?
    var image: UIImage? {
        guard let imagePath = imagePath,
            let url = URL(string: imagePath) else { return nil }

        let data = dataFrom(imagePath: url)
        let image = UIImage(data: data)

        return image
    }

}

// MARK: - Private Methods

private extension Profile {
    func dataFrom(imagePath: URL) throws -> Data {
        let data = try Data(contentsOf: imagePath)
        return data
    }
}
