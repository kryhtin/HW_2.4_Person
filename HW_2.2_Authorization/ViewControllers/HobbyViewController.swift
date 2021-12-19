//
//  HobbyViewController.swift
//  HW_2.2_Authorization
//
//  Created by Dmitriy Kryhtin on 17.12.2021.
//

import UIKit
import AVKit

class HobbyViewController: UIViewController {
  @IBOutlet weak var hobbyText: UITextView!
  
  var player: AVPlayer?
  var user: User!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tabBarController = self.tabBarController as! TabViewController
    hobbyText.text = tabBarController.user.person.hobby
  }

  @IBAction func pressPlayButtonTatuN() {
    playSound(name: "Nas ne dogonjat", image: "tatuN")
  }
  
  @IBAction func pressPlayButtonToy() {
    playSound(name: "toy", image: "toy")
  }
  
  @IBAction func pressPlayButtonTatuA() {
    playSound(name: "all the think she said", image: "tatuA")
  }
  
  func playSound(name: String, image: String) {
    guard let path = Bundle.main.path(forResource: name, ofType:"mp3") else { return }
    
    let imageView = UIImageView(frame: UIScreen.main.bounds)
    imageView.image = UIImage(named: image)
    imageView.contentMode = .scaleAspectFit
    
    let url = URL(fileURLWithPath: path)
    player = AVPlayer(url: url)
    let playerViewController = AVPlayerViewController()
    playerViewController.player = player
    playerViewController.contentOverlayView?.addSubview(imageView)
    self.present(playerViewController, animated: true) {
      playerViewController.player?.play()
    }
  }
}
