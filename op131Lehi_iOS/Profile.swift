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

    var imageData: Data?
    var image: UIImage? {
        guard let imageData = imageData else { return nil }

        let image = UIImage(data: imageData)
        return image
    }

    init(id: Int?, givenName: String, surname: String, username: String, imageData: Data? = nil) {
        self.id = id
        self.givenName = givenName
        self.surname = surname
        self.username = username
        self.imageData = imageData
    }
}

// MARK: - Private Methods

private extension Profile {
    func dataFrom(imagePath: String?) throws -> Data? {
        guard let imagePath = imagePath,
            let url = URL(string: imagePath) else { return nil }

        let data = try Data(contentsOf: url)
        return data
    }
}

// MARK: - JSONDecoable

extension Profile: JSONDecodable {
    init?(json: JSONType) {
        guard let id = json[Keys.lehiUserID] as? Int,
            let givenName = json[Keys.givenName] as? String,
            let surname = json[Keys.surname] as? String,
            let username = json[Keys.username] as? String else { return nil }

        let imagePath = json[Keys.imagePath] as? String

        self.init(id: id, givenName: givenName, surname: surname, username: username)

        do {
            imageData = try dataFrom(imagePath: imagePath)
        } catch {
            return nil
        }

    }

    func json(fromData data: Profile) -> JSONType {
        let json: JSONType = [
            Keys.givenName: givenName,
            Keys.surname: surname,
            Keys.username: username]

        return json
    }
}
