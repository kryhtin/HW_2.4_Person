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
  
  override func viewWillAppear(_ animated: Bool) {
      setGradientBackground()
      super.viewWillAppear(animated)
  }
  
  @IBAction func pressLogOut() {
    dismiss(animated: true)
  }
  
  private func setGradientBackground() {
    let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
    let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
    
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [colorTop, colorBottom]
    gradientLayer.locations = [0.0, 1.0]
    gradientLayer.frame = self.view.bounds
    
    self.view.layer.insertSublayer(gradientLayer, at:0)
  }
}
