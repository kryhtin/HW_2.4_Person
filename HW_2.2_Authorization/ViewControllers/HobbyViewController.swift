//
//  HobbyViewController.swift
//  HW_2.2_Authorization
//
//  Created by Dmitriy Kryhtin on 17.12.2021.
//

import UIKit
import AVKit

class HobbyViewController: UIViewController {
  
  var player: AVPlayer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    playSound()
  }

  func playSound() {
    guard let path = Bundle.main.path(forResource: "Nas ne dogonjat", ofType:"mp3") else { return }
    let url = URL(fileURLWithPath: path)
    
    player = AVPlayer(url: url)
    let playerViewController = AVPlayerViewController()
    playerViewController.player = player
    self.present(playerViewController, animated: true) {
      playerViewController.player!.play()
    }
  }
}
