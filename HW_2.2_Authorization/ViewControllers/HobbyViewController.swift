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
    let url = URL(fileURLWithPath: path)
    let imageView = UIImageView(frame: UIScreen.main.bounds)
    imageView.image = UIImage(named: image)
    imageView.contentMode = .scaleAspectFit
    
    player = AVPlayer(url: url)
    let playerViewController = AVPlayerViewController()
    playerViewController.player = player
//    playerViewController.view.frame.size = imageView.frame
    playerViewController.contentOverlayView?.addSubview(imageView)
    self.present(playerViewController, animated: true) {
      playerViewController.player!.play()
    }
  }
}
