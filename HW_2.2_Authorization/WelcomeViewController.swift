//
//  WelcomeViewController.swift
//  HW_2.2_Authorization
//
//  Created by Dmitriy Kryhtin on 14.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
  @IBOutlet weak var welcomeLabel: UILabel!
  
  var welcomeStr: String!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    welcomeLabel.text = "Welcome, \(welcomeStr ?? "User")!"
  }
  
  @IBAction func pressLogOut() {
    dismiss(animated: true)
  }
}
