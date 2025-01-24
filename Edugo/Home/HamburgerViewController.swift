//
//  HamburgerViewController.swift
//  Edugo
//
//  Created by Celestial on 12/01/25.
//

import UIKit

class HamburgerViewController: UIViewController {
    var userDetails: [String: Any]?
    @IBOutlet weak var mainBackgroundImage: UIView!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupHambergerUI()
        print("HamburgerViewController userDetails: \(String(describing: userDetails))")
        
       
    }

    private func setupHambergerUI(){
        
        self.mainBackgroundImage.layer.cornerRadius = 20
        self.mainBackgroundImage.clipsToBounds = true
        
        
        self.profileImage.layer.cornerRadius = 40
        self.profileImage.clipsToBounds = true
        
    }
    
    
    
    
    
    
    
    
    
    
    @IBAction func covid19(_ sender: Any) {
    }
    
    @IBAction func profile(_ sender: Any) {
        performSegue(withIdentifier: "DetailOnline", sender: nil)
    }
    
    @IBAction func tolktoUS(_ sender: Any) {
        if let phoneURL = URL(string: "tel://9643545679"),
               UIApplication.shared.canOpenURL(phoneURL) {
                UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
            } else {
                print("Cannot open dialer.")
            }
    }
    
    @IBAction func faqs(_ sender: Any) {
    }
    
    @IBAction func setting(_ sender: Any) {
    }
    
    @IBAction func logout(_ sender: Any) {
        showLoginScreen()
    }
    func showLoginScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            // Set the login screen as the root view controller
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                window.rootViewController = loginVC
                window.makeKeyAndVisible()
                
                // Optional: Add a transition animation
                UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "DetailOnline" {
               if let profileVC = segue.destination as? ProfileViewController {
                   profileVC.userDetails = userDetails
               }
           }
       }
    
}
