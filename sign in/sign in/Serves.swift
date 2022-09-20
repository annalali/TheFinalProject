//
//  ViewController.swift
//  TapBar
//
//  Created by sarahAldosari on 18/02/1444 AH.
//

import UIKit

class Serves: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource{
    var arrayImage = [Image]()
    var arrayName = ["sara"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)as! ServesCell
        let images = arrayImage[indexPath.row]
        cell.setupCell(photo:images.photo,Name: images.Name)
        
        
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {



        performSegue(withIdentifier: "\(indexPath.item)", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
    }

    @IBOutlet weak var CollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.delegate = self
        CollectionView.dataSource = self
       
        
        arrayImage.append(Image(photo : UIImage(named: "3")!,Name: "A"))
        
        arrayImage.append(Image(photo : UIImage(named: "4")!,Name: "B"))
        arrayImage.append(Image(photo : UIImage(named: "2")!,Name: "C"))
        
        // Do any additional setup after loading the view.
    }


}

struct Image {
    
    let photo : UIImage
    let Name : String
    
    
}
