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
  
  override func viewDidLoad() {
    super.viewDidLoad()

    loginButtonDisabled()
  }
  
  @IBAction func pressForgotUserName() {
    showAlert(title: "Oops!", message: "Your name is Alex")
  }
  
  @IBAction func pressForgotPassword() {
    showAlert(title: "Oops!", message: "Your password is 123456")
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let welcomeVS = segue.destination as! WelcomeViewController
    welcomeVS.welcomeStr = userNameTF.text
  }
  
  @IBAction func unwind(for segue: UIStoryboardSegue) {
    userNameTF.text = nil
    passwordTF.text = nil
    loginButtonDisabled()
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super .touchesBegan(touches, with: event)
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
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let text = (userNameTF.text! as NSString).replacingCharacters(in: range, with: string)
    if text.isEmpty {
      loginButtonDisabled()
    } else {
      loginButtonEnabled()
    }
    return true
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField.returnKeyType == .next {
      userNameTF.resignFirstResponder()
      passwordTF.becomeFirstResponder()
    } else if textField.returnKeyType == .done {
      self.performSegue(withIdentifier: "welcomeSegue", sender: self)
    }
    return true
  }
  
  private func loginButtonEnabled() {
    loginButton.isEnabled = true
    loginButton.alpha = 1.0
  }
  
  private func loginButtonDisabled() {
    loginButton.isEnabled = false
    loginButton.alpha = 0.5
  }
}

