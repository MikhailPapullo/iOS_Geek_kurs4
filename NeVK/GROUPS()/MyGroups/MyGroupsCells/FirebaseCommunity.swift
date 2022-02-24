//
//  FirebaseCommunity.swift
//  NeVK
//
//  Created by Mikhail Papullo on 2/7/22.
//

import Firebase

// MARK: - Firebase для групп
class FirebaseCommunity {

    let groupName: String

    let groupId: Int

    let ref: DatabaseReference?

    init(name: String, id: Int) {
        self.ref = nil
        self.groupId = id
        self.groupName = name
    }

    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String:Any],

            let id = value["groupId"] as? Int,

            let name = value["groupName"] as? String

        else {
            return nil
        }

        self.ref = snapshot.ref
        self.groupId = id
        self.groupName = name
    }

    func toAnyObject() -> [String: Any] {
        return [
            "groupId": groupId,
            "groupName": groupName
        ]
    }
}
