import UIKit
class SignupViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.clipsToBounds = true
    }

    @IBAction func selectProfilePhoto(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            profileImageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }

    @IBAction func signupButtonTapped(_ sender: UIButton) {
        guard let firstName = firstNameTextField.text,
              let lastName = lastNameTextField.text,
              let email = emailTextField.text,
              let mobile = mobileTextField.text,
              let city = cityTextField.text,
              let state = stateTextField.text,
              let password = passwordTextField.text,
              let confirmPassword = confirmPasswordTextField.text,
              !firstName.isEmpty,
              !lastName.isEmpty,
              !email.isEmpty,
              !mobile.isEmpty,
              !city.isEmpty,
              !state.isEmpty,
              !password.isEmpty,
              password == confirmPassword else {
            print("Please fill all fields correctly.")
            return
        }

        let imageData = profileImageView.image?.jpegData(compressionQuality: 0.8)

        let userDetails: [String: Any] = [
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "mobile": mobile,
            "city": city,
            "state": state,
            "password": password,
            "profileImage": imageData ?? Data()
        ]

        UserDefaults.standard.set(userDetails, forKey: email)
        print("User registered successfully!")
        navigationController?.popViewController(animated: true)
    }
}
