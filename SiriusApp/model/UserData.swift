//
//  UserData.swift
//  SiriusApp
//
//  Created by Всеволод on 11/02/2019.
//  Copyright © 2019 me4air. All rights reserved.
//


import Foundation
import RealmSwift


class MyImageStorage{
    var imagePath: NSString?
}

class UserData: Object {
    @objc dynamic var name = ""
    @objc dynamic var surName = ""
    @objc dynamic var avatar = ""
}

