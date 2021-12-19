//
//  WelcomeViewController.swift
//  HW_2.2_Authorization
//
//  Created by Dmitriy Kryhtin on 14.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
  @IBOutlet weak var welcomeLabel: UILabel!
  @IBOutlet weak var aboutMeText: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tabBarController = self.tabBarController as! TabViewController
    welcomeLabel.text = "Welcome, \(tabBarController.user.username)!"
    aboutMeText.text = tabBarController.user.person.aboutMe
  }
}
