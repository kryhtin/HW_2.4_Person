//
//  User.swift
//  HW_2.2_Authorization
//
//  Created by Dmitriy Kryhtin on 17.12.2021.
//

import Foundation

class User {
  var username: String
  var password: String
  let person: Person = Person()
  
  init(username: String, password: String) {
    self.username = username
    self.password = password
  }
}
