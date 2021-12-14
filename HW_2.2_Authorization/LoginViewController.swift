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

