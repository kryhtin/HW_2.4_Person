//
//  ViewController.swift
//  HW_2.2_Authorization
//
//  Created by Dmitriy Kryhtin on 14.12.2021.
//

import UIKit

class LoginViewController: UIViewController {
  @IBOutlet weak var userNameTF: UITextField!
  @IBOutlet weak var passwordTF: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  
  var user: User!
  
  @IBAction func pressForgotUserName() {
    showAlert(title: "Oops!", message: "Your name is Dmitriy")
  }
  
  @IBAction func pressForgotPassword() {
    showAlert(title: "Oops!", message: "Your password is 123456")
  }
  
  @IBAction func pressLogIn() {
    do {
      let username = try userNameTF.validatedText(validationType: .username)
      let password = try passwordTF.validatedText(validationType: .password)
      user = User(username: username, password: password)
      performSegue(withIdentifier: "WelcomeSegue", sender: self)
    } catch let error {
      let message = (error as! ValidationError).message
      showAlert(title: "Oops!", message: message)
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let tabBarController = segue.destination as! TabViewController
    tabBarController.user = user
  }
  
  @IBAction func unwind(for segue: UIStoryboardSegue) {
    userNameTF.text = nil
    passwordTF.text = nil
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super .touchesBegan(touches, with: event)
    view.endEditing(true)
  }
}

extension LoginViewController {
  private func showAlert(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default)
    alert.addAction(okAction)
    present(alert, animated: true)
  }
}

extension LoginViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField.returnKeyType == .next {
      passwordTF.becomeFirstResponder()
    } else if textField.returnKeyType == .done {
      self.performSegue(withIdentifier: "WelcomeSegue", sender: self)
    }
    return true
  }
}

extension UITextField {
  func validatedText(validationType: ValidatorType) throws -> String {
    let validator = VaildatorFactory.validatorFor(type: validationType)
    return try validator.validated(self.text)
  }
}

