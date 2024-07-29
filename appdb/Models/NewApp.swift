//
//  OfficialApp.swift
//  appdb
//
//  Created by ned on 20/07/24.
//  Copyright © 2024 ned. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper

class OfficialApp: NewApp {
    override class func type() -> ItemType {
        .official
    }
}

class RepoApp: NewApp {
    override class func type() -> ItemType {
        .repo
    }
}

class UserApp: NewApp {
    override class func type() -> ItemType {
        .user
    }
}

class NewApp: Item {

    required init?(map: Map) {
        super.init(map: map)
    }

    override var id: Int {
        get { super.id }
        set { super.id = newValue }
    }

    override class func type() -> ItemType {
        .official
    }

    static func == (lhs: NewApp, rhs: NewApp) -> Bool {
        lhs.universalIdentifier == rhs.universalIdentifier && lhs.version == rhs.version
    }

    var name: String = ""
    var icon: String = ""
    var version: String = ""
    var developer: String = ""
    var description_: String = ""
    var universalIdentifier: String = ""

    override func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        icon <- map["icon_uri"]
        version <- map["version"]
        developer <- map["developer_name"]
        universalIdentifier <- map["universal_object_identifier"]
        description_ <- map["description"]
    }
}
