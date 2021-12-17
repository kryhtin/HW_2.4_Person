//
//  Validation.swift
//  HW_2.2_Authorization
//
//  Created by Dmitriy Kryhtin on 17.12.2021.
//

protocol ValidatorConvertible {
  func validated(_ value: String?) throws -> String
}

class ValidationError: Error {
  var message: String
  
  init(_ message: String) {
    self.message = message
  }
}

enum ValidatorType {
  case password
  case username
}

enum VaildatorFactory {
  static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
    switch type {
      case .username: return UserNameValidator()
      case .password: return PasswordValidator()
    }
  }
}

struct UserNameValidator: ValidatorConvertible {
  func validated(_ value: String?) throws -> String {
    guard value != "" else { throw ValidationError("User name is Required") }
    guard value == "Dmitriy" else { throw ValidationError("User name is Incorrect") }
    return value!
  }
}

struct PasswordValidator: ValidatorConvertible {
  func validated(_ value: String?) throws -> String {
    guard value != "" else { throw ValidationError("Password is Required") }
    guard value == "123456" else { throw ValidationError("Password is Incorrect") }
    return value!
  }
}
