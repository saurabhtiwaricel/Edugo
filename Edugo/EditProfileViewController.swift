import UIKit

protocol EditProfileDelegate: AnyObject {
    func didUpdateProfile(updatedDetails: [String: Any])
}

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!

    var userDetails: [String: Any]?
    weak var delegate: EditProfileDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupEditFields()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.clipsToBounds = true
    }

    func setupEditFields() {
        guard let details = userDetails else { return }
        firstNameTextField.text = details["firstName"] as? String
        lastNameTextField.text = details["lastName"] as? String
        emailTextField.text = details["email"] as? String
        mobileTextField.text = details["mobile"] as? String
        cityTextField.text = details["city"] as? String
        stateTextField.text = details["state"] as? String

        if let imageData = details["profileImage"] as? Data,
           let image = UIImage(data: imageData) {
            profileImageView.image = image
        }
    }

    @IBAction func selectProfilePhotoTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[.originalImage] as? UIImage {
            profileImageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let firstName = firstNameTextField.text,
              let lastName = lastNameTextField.text,
              let email = emailTextField.text,
              let mobile = mobileTextField.text,
              let city = cityTextField.text,
              let state = stateTextField.text,
              !firstName.isEmpty,
              !lastName.isEmpty,
              !email.isEmpty,
              !mobile.isEmpty,
              !city.isEmpty,
              !state.isEmpty else {
            print("Please fill all fields correctly.")
            return
        }

        var updatedDetails = userDetails ?? [:]
        updatedDetails["firstName"] = firstName
        updatedDetails["lastName"] = lastName
        updatedDetails["email"] = email
        updatedDetails["mobile"] = mobile
        updatedDetails["city"] = city
        updatedDetails["state"] = state

        if let profileImage = profileImageView.image,
           let imageData = profileImage.pngData() {
            updatedDetails["profileImage"] = imageData
        }

        UserDefaults.standard.set(updatedDetails, forKey: email)
        delegate?.didUpdateProfile(updatedDetails: updatedDetails)
        navigationController?.popViewController(animated: true)
    }
}
