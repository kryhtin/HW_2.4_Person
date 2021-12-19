//
//  WorkViewController.swift
//  HW_2.2_Authorization
//
//  Created by Dmitriy Kryhtin on 17.12.2021.
//

import UIKit

class WorkViewController: UIViewController {
  @IBOutlet weak var workText: UITextView!
  
  var user: User!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tabBarController = self.tabBarController as! TabViewController
    workText.text = tabBarController.user.person.work
  }
}
