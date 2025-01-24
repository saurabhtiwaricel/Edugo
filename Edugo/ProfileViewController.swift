import UIKit
class ProfileViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!

    var userDetails: [String: Any]?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ProfileViewController Loaded: \(String(describing: userDetails))")
        setupProfile()
    }

    func setupProfile() {
        guard let details = userDetails else {
            print("No userDetails in ProfileViewController")
            return
        }

        print("Setting up Profile with details: \(details)")

        nameLabel.text = "\(details["firstName"] ?? "") \(details["lastName"] ?? "")"
        emailLabel.text = details["email"] as? String
        mobileLabel.text = details["mobile"] as? String
        cityLabel.text = details["city"] as? String
        stateLabel.text = details["state"] as? String

        if let imageData = details["profileImage"] as? Data,
           let image = UIImage(data: imageData) {
            profileImageView.image = image
        }

        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.clipsToBounds = true
    }

    @IBAction func editProfileTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let editVC = storyboard.instantiateViewController(withIdentifier: "EditProfileViewController") as? EditProfileViewController {
            editVC.userDetails = userDetails
            editVC.delegate = self
            navigationController?.pushViewController(editVC, animated: true)
        }
    }
}

extension ProfileViewController: EditProfileDelegate {
    func didUpdateProfile(updatedDetails: [String: Any]) {
        userDetails = updatedDetails
        setupProfile()
    }
}
