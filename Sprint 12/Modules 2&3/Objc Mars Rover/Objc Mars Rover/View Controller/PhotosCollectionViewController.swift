//
//  PhotosCollectionViewController.swift
//  Astronomy
//
//  Created by Andrew R Madsen on 9/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let osiMarsRoverClient = OSIMarsRoverClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        osiMarsRoverClient.search(forRover: "curiosity") { rover, error in
            if let error = error {
                NSLog("Error fetching info for curiosity: \(error)")
                return
            }
            self.roverInfo = rover
            
        }
        
        
        
        configureTitleView()
        updateViews()
    }
    
    @IBAction func goToPreviousSol(_ sender: Any?) {
        guard let solDescription = solDescription else { return }
        guard let solDescriptions = roverInfo?.photos else { return }
        guard let index = solDescriptions.index(of: solDescription) else { return }
        guard index > 0 else { return }
        self.solDescription = solDescriptions[index-1]
    }
    
    @IBAction func goToNextSol(_ sender: Any?) {
        guard let solDescription = solDescription else { return }
        guard let solDescriptions = roverInfo?.photos else { return }
        guard let index = solDescriptions.index(of: solDescription) else { return }
        guard index < solDescriptions.count - 1 else { return }
        self.solDescription = solDescriptions[index+1]
    }
    
    // UICollectionViewDataSource/Delegate
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        NSLog("num photos: \(photoReferences.count)")
        return photoReferences.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCollectionViewCell else { return ImageCollectionViewCell() }
       // let photoRef = photoReferences[indexPath.row]
       // cell.imageView.image = UIImage(named: photoRef.imgSrc!)
     //   loadImage(forCell: cell, forItemAt: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if photoReferences.count > 0 {
        //    let photoRef = photoReferences[indexPath.item]
            //operations[photoRef.id]?.cancel()
        } else {
            for (_, operation) in operations {
                operation.cancel()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        var totalUsableWidth = collectionView.frame.width
        let inset = self.collectionView(collectionView, layout: collectionViewLayout, insetForSectionAt: indexPath.section)
        totalUsableWidth -= inset.left + inset.right
        
        let minWidth: CGFloat = 150.0
        let numberOfItemsInOneRow = Int(totalUsableWidth / minWidth)
        totalUsableWidth -= CGFloat(numberOfItemsInOneRow - 1) * flowLayout.minimumInteritemSpacing
        let width = totalUsableWidth / CGFloat(numberOfItemsInOneRow)
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10.0, bottom: 0, right: 10.0)
    }
    
    // MARK: - Navigation
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowDetail" {
//            guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
//            let detailVC = segue.destination as! PhotoDetailViewController
//            detailVC.photo = photoReferences[indexPath.item]
//        }
//    }
    
    // MARK: - Private
    
    private func configureTitleView() {
        
        let font = UIFont.systemFont(ofSize: 30)
        let attrs = [NSAttributedString.Key.font: font]

        let prevTitle = NSAttributedString(string: "<", attributes: attrs)
        let prevButton = UIButton(type: .system)
        prevButton.accessibilityIdentifier = "PhotosCollectionViewController.PreviousSolButton"
        prevButton.setAttributedTitle(prevTitle, for: .normal)
        prevButton.addTarget(self, action: #selector(goToPreviousSol(_:)), for: .touchUpInside)
        
        let nextTitle = NSAttributedString(string: ">", attributes: attrs)
        let nextButton = UIButton(type: .system)
        nextButton.setAttributedTitle(nextTitle, for: .normal)
        nextButton.addTarget(self, action: #selector(goToNextSol(_:)), for: .touchUpInside)
        nextButton.accessibilityIdentifier = "PhotosCollectionViewController.NextSolButton"
        
        let stackView = UIStackView(arrangedSubviews: [prevButton, solLabel, nextButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = UIStackView.spacingUseSystem
        
        navigationItem.titleView = stackView
    }
    
    private func updateViews() {
        guard isViewLoaded else { return }
        solLabel.text = "Sol \(solDescription?.sol ?? 0)"
    }
    
//    private func loadImage(forCell cell: ImageCollectionViewCell, forItemAt indexPath: IndexPath) {
//        let photoReference = photoReferences[indexPath.item]
//        // Check for image in cache
//        if let cachedImage = cache.value(for: photoReference.id) {
//            cell.imageView.image = cachedImage
//            return
//        }
//
//        // Start an operation to fetch image data
//       // let fetchOp = FetchPhotoOperation(photoReference: photoReference)
//        let cacheOp = BlockOperation {
//            if let image = fetchOp.image {
//                self.cache.cache(value: image, for: photoReference.id)
//            }
//        }
//        let completionOp = BlockOperation {
//            defer { self.operations.removeValue(forKey: photoReference.id) }
//
//            if let currentIndexPath = self.collectionView?.indexPath(for: cell),
//                currentIndexPath != indexPath {
//                return // Cell has been reused
//            }
//
//            if let image = fetchOp.image {
//                cell.imageView.image = image
//            }
//        }
//
//        cacheOp.addDependency(fetchOp)
//        completionOp.addDependency(fetchOp)
//
//        photoFetchQueue.addOperation(fetchOp)
//        photoFetchQueue.addOperation(cacheOp)
//        OperationQueue.main.addOperation(completionOp)
//
//        operations[photoReference.id] = fetchOp
//    }
    
    // Properties
    
   
   // private let cache = Cache<Int, UIImage>()
    private let photoFetchQueue = OperationQueue()
    private var operations = [Int : Operation]()
    
    private var roverInfo: OSIMarsRover? {
        didSet {
            solDescription = roverInfo?.photos?[0]
        }
    }
    
    private var photo: MarsPhotoReference? {
        didSet {
            
        }
    }
    
    private var solDescription: OSIPhoto? {
        didSet {
            if let rover = roverInfo,
                let sol = solDescription?.sol {
                photoReferences = []
                osiMarsRoverClient.fetchPhotosFrome(rover, onSol: Int32(truncating: sol)) {photoRef, error in
                    
                    if let error = error {
                        NSLog("Error fetching info for curiosity: \(error)")
                        return
                    }
                 // self.photoReferences = photoRef.photos ?? []
                    
                }
                
                    DispatchQueue.main.async { self.updateViews() }
                    
                }
               
                
            }
        }
    
    
    private var photoReferences = [OSIPhoto]() {
        didSet {
           // cache.clear()
            DispatchQueue.main.async { self.collectionView?.reloadData() }
        }
    }
    
    @IBOutlet var collectionView: UICollectionView!
    let solLabel = UILabel()
}
