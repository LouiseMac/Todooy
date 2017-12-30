//
//  Category.swift
//  Todooy
//
//  Created by Lou Macleod on 29/12/2017.
//  Copyright © 2017 Lou Macleod. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
  @objc dynamic var name: String = ""
  let items = List<Item>()
}
