import UIKit

class StoreViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let storeItems: [StoreItem] = [
        StoreItem(
            image1: UIImage(named: "storeImage11") ?? UIImage(named: "placeholder")!,
            image2: UIImage(named: "storeImage22") ?? UIImage(named: "placeholder")!,
            image3: UIImage(named: "storeImage13") ?? UIImage(named: "placeholder")!,
            image4: UIImage(named: "storeImage14") ?? UIImage(named: "placeholder")!,
            image5: UIImage(named: "storeImage15") ?? UIImage(named: "placeholder")!
        ),
        StoreItem(
            image1: UIImage(named: "storeImage21") ?? UIImage(named: "placeholder")!,
            image2: UIImage(named: "storeImage22") ?? UIImage(named: "placeholder")!,
            image3: UIImage(named: "storeImage23") ?? UIImage(named: "placeholder")!,
            image4: UIImage(named: "storeImage24") ?? UIImage(named: "placeholder")!,
            image5: UIImage(named: "storeImage15") ?? UIImage(named: "placeholder")!
        ),
        StoreItem(
            image1: UIImage(named: "storeImage31") ?? UIImage(named: "placeholder")!,
            image2: UIImage(named: "storeImage32") ?? UIImage(named: "placeholder")!,
            image3: UIImage(named: "storeImage33") ?? UIImage(named: "placeholder")!,
            image4: UIImage(named: "storeImage24") ?? UIImage(named: "placeholder")!,
            image5: UIImage(named: "storeImage35") ?? UIImage(named: "placeholder")!
        ),
        StoreItem(
            image1: UIImage(named: "storeImage41") ?? UIImage(named: "placeholder")!,
            image2: UIImage(named: "storeImage22") ?? UIImage(named: "placeholder")!,
            image3: UIImage(named: "storeImage13") ?? UIImage(named: "placeholder")!,
            image4: UIImage(named: "storeImage44") ?? UIImage(named: "placeholder")!,
            image5: UIImage(named: "storeImage45") ?? UIImage(named: "placeholder")!
        ),
        StoreItem(
            image1: UIImage(named: "storeImage11") ?? UIImage(named: "placeholder")!,
            image2: UIImage(named: "storeImage22") ?? UIImage(named: "placeholder")!,
            image3: UIImage(named: "storeImage13") ?? UIImage(named: "placeholder")!,
            image4: UIImage(named: "storeImage14") ?? UIImage(named: "placeholder")!,
            image5: UIImage(named: "storeImage15") ?? UIImage(named: "placeholder")!
        ),
        StoreItem(
            image1: UIImage(named: "storeImage21") ?? UIImage(named: "placeholder")!,
            image2: UIImage(named: "storeImage22") ?? UIImage(named: "placeholder")!,
            image3: UIImage(named: "storeImage23") ?? UIImage(named: "placeholder")!,
            image4: UIImage(named: "storeImage24") ?? UIImage(named: "placeholder")!,
            image5: UIImage(named: "storeImage15") ?? UIImage(named: "placeholder")!
        ),
        StoreItem(
            image1: UIImage(named: "storeImage31") ?? UIImage(named: "placeholder")!,
            image2: UIImage(named: "storeImage32") ?? UIImage(named: "placeholder")!,
            image3: UIImage(named: "storeImage33") ?? UIImage(named: "placeholder")!,
            image4: UIImage(named: "storeImage24") ?? UIImage(named: "placeholder")!,
            image5: UIImage(named: "storeImage35") ?? UIImage(named: "placeholder")!
        ),
        StoreItem(
            image1: UIImage(named: "storeImage41") ?? UIImage(named: "placeholder")!,
            image2: UIImage(named: "storeImage22") ?? UIImage(named: "placeholder")!,
            image3: UIImage(named: "storeImage13") ?? UIImage(named: "placeholder")!,
            image4: UIImage(named: "storeImage44") ?? UIImage(named: "placeholder")!,
            image5: UIImage(named: "storeImage45") ?? UIImage(named: "placeholder")!
        )
    ]

    
    let images: [UIImage] = [
        UIImage(named: "storeImage1"),
        UIImage(named: "storeImage2"),
        UIImage(named: "storeImage3"),
        UIImage(named: "storeImage4"),
        UIImage(named: "storeImage1"),
        UIImage(named: "storeImage2"),
        UIImage(named: "storeImage3"),
        UIImage(named: "storeImage4")
    ].compactMap { $0 }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! StoreCollectionViewCell
        cell.storeImage.image = images[indexPath.item]
        cell.storeImage.layer.cornerRadius = 50.0
        cell.storeImage.clipsToBounds = true 
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 20
        let availableWidth = collectionView.frame.width - padding
        let width = availableWidth / 2
        return CGSize(width: width, height: 173)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          collectionView.deselectItem(at: indexPath, animated: true)
          performSegue(withIdentifier: "DetailStore", sender: indexPath)
      }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "DetailStore" {
              if let destinationVC = segue.destination as? DetailStoreViewController,
                 let indexPath = sender as? IndexPath {
                  let selectedItem = storeItems[indexPath.item]
                  destinationVC.image1 = selectedItem.image1
                  destinationVC.image2 = selectedItem.image2
                  destinationVC.image3 = selectedItem.image3
                  destinationVC.image4 = selectedItem.image4
                  destinationVC.image5 = selectedItem.image5
              }
          }
      }
    
}
