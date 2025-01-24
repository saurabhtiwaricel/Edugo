import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            print("Please fill in all fields.")
            return
        }

        if let userDetails = UserDefaults.standard.dictionary(forKey: email),
           userDetails["password"] as? String == password {
            print("User authenticated: \(userDetails)")

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let tabBarController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as? UITabBarController {

                if let viewControllers = tabBarController.viewControllers,
                   let homeNavController = viewControllers[0] as? UINavigationController,
                   let homeVC = homeNavController.topViewController as? HomeViewController {
                    homeVC.userDetails = userDetails
                    print("Passed userDetails to HomeViewController")
                }

                (UIApplication.shared.connectedScenes.first?.delegate as? UIWindowSceneDelegate)?.window??.rootViewController = tabBarController
            }
        } else {
            print("Invalid email or password.")
        }
    }
}
