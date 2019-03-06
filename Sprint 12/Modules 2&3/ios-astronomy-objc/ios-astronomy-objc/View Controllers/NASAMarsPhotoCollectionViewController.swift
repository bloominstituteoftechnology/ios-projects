//
//  NASAMarsPhotoCollectionViewController.swift
//  ios-astronomy-objc
//
//  Created by Austin Cole on 3/5/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class NASAMarsPhotoCollectionViewController: UICollectionViewController {
    
    var networkingController: NASAMarsPhotosNetworkingClient?

    override func viewDidLoad() {
        super.viewDidLoad()
        networkingController = NASAMarsPhotosNetworkingClient()
        networkingController?.fetchPhotos(withRover: "curiosity", completion: { (error) in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if networkingController?.solChanged == true {
            networkingController?.fetchPhotos(withRover: "curiosity", completion: { (error) in
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            })
        }
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SettingsSegue" {
            let destination = segue.destination as! ABCSearchSettingsViewController
            destination.networkingController = self.networkingController!
        } else {
            let indexPath = collectionView.indexPathsForSelectedItems?.first
            let secureURL = URL(string: (networkingController?.photoReferences[(indexPath?.row)!] as! MarsPhotoReference).img_src.secureURLString())
//            do {
//                data = try Data(contentsOf: secureURL!)
//            } catch {
//                print(error)
            let data = try! Data(contentsOf: secureURL!)
            let destination = segue.destination as! NASAMarsPhotoDetailViewController
            destination.data = data
//                }
        }
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return networkingController?.photoReferences.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ABCPhotoCollectionViewCell
        
        let urlString =  (networkingController?.photoReferences[indexPath.row] as! MarsPhotoReference).img_src
        let secureURLString = urlString.secureURLString()
        
        
        let url = URL(string: secureURLString)
        
        var data = Data.init()
        
        do {
            data = try Data(contentsOf: url!)
        } catch {
            print(error)
        }
        
        
        let image = UIImage(data: data)
        
        cell.marsPhotoImageView?.image = image
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    

}
