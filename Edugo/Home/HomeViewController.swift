import UIKit

class HomeViewController: UIViewController {
    var userDetails: [String: Any]?
    var isSideViewOpen = false  // Added declaration
    
    @IBOutlet var mainBackView: UIView!
    @IBOutlet weak var sideview: UIView!
    @IBOutlet weak var sidebar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sidebar.isHidden = true
        sideview.isHidden = true
    }
    
//    @IBAction func online(_ sender: Any) {
//        performSegue(withIdentifier: "DetailOnline", sender: nil)
//    }
    
    @IBAction func showHamburgerMenu(_ sender: Any) {
        self.view.bringSubviewToFront(sideview)  // Corrected method name
        sidebar.isHidden = false
        sideview.isHidden = false
        
        let sideViewWidth: CGFloat = 259
        let sideViewHeight: CGFloat = 499
        
        if !isSideViewOpen {
            isSideViewOpen = true
            sideview.frame = CGRect(x: 0, y: 88, width: 0, height: sideViewHeight)
            sidebar.frame = CGRect(x: 0, y: 0, width: 0, height: sideViewHeight)
            
            UIView.animate(withDuration: 0.3) {
                self.sideview.frame = CGRect(x: 0, y: 88, width: sideViewWidth, height: sideViewHeight)
                self.sidebar.frame = CGRect(x: 0, y: 0, width: sideViewWidth, height: sideViewHeight)
            }
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.sideview.frame = CGRect(x: 0, y: 88, width: 0, height: sideViewHeight)
                self.sidebar.frame = CGRect(x: 0, y: 0, width: 0, height: sideViewHeight)
            }) { _ in
                self.sidebar.isHidden = true
                self.sideview.isHidden = true
                self.isSideViewOpen = false
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HamburgerMenuSegue" {
            if let hamburgerVC = segue.destination as? HamburgerViewController {
                hamburgerVC.userDetails = userDetails
                print("Passing userDetails to HamburgerViewController: \(String(describing: userDetails))")
            } else {
                print("Failed to cast destination to HamburgerViewController")
            }
        }
    }

}
