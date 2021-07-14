//
//  WelcomeViewController.swift
//  homeWork 2.3
//
//  Created by Артур Ким on 13.07.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var name = ""
    
    @IBOutlet weak var backgroundGradientView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "Welcome, \(name)!"
        
        let gradient = CAGradientLayer()
        
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.systemIndigo.cgColor, UIColor.black.cgColor]
        gradient.startPoint = CGPoint (x: 0.0,y: 0.0)
        gradient.endPoint = CGPoint (x: 1.0,y: 1.0)
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    @IBAction func returnToLogin() {
        dismiss(animated: true)
    }
    
}
