import UIKit
import MapKit

class CentresViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource {
   
    
    @IBOutlet weak var korolBagh: UIButton!
    
    var web:[String] = ["Centres1","Centres2"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonText = "Plot 3-B, Trird Floor, Pusa Road, Karol Bagh,New Delhi - 1005"
        let attributedString = NSAttributedString(string: buttonText, attributes: [
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ])
        
        korolBagh.setAttributedTitle(attributedString, for: .normal)
    }

    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return web.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Centrescell", for: indexPath) as! CentresCollectionViewCell
        cell.ImageCell.image = UIImage(named: web[indexPath.row])
        return cell
    }
    @IBAction func link1(_ sender: UIButton) {
        
            let latitude: CLLocationDegrees = 37.7749
            let longitude: CLLocationDegrees = -122.4194
            let regionDistance: CLLocationDistance = 1000
            let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let regionSpan = MKCoordinateRegion(center: coordinates,
                                                latitudinalMeters: regionDistance,
                                                longitudinalMeters: regionDistance)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
            ]
            
            let placemark = MKPlacemark(coordinate: coordinates)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = "Target Location"
            mapItem.openInMaps(launchOptions: options)
        }
    
    
    }

    
    

