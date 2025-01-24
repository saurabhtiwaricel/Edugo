//
//  DetailStoreViewController.swift
//  Edugo
//
//  Created by Celestial on 05/01/25.
//

import UIKit

class DetailStoreViewController: UIViewController {

    @IBOutlet weak var DetailImage2: UIImageView!
    @IBOutlet weak var DetailImage1: UIImageView!
    
    @IBOutlet weak var DetailImage3: UIImageView!
    
    @IBOutlet weak var DetailImage4: UIImageView!
    
    @IBOutlet weak var DetailImageJoin: UIImageView!
    
    var image1: UIImage?
    var image2: UIImage?
    var image3: UIImage?
    var image4: UIImage?
    var image5: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailImage1.image = image1
        DetailImage2.image = image2
        DetailImage3.image = image3
        DetailImage4.image = image4
        DetailImageJoin.image = image5
     
    }
    

  

}
