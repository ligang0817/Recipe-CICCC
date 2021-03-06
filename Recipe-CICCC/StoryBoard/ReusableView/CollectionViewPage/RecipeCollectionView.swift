//
//  RecipeCollectionView.swift
//  Recipe-CICCC
//
//  Created by fangyilai on 2020-02-17.
//  Copyright © 2020 Argus Chen. All rights reserved.
//

import UIKit

@IBDesignable
class RecipeCollectionView: UIView {

    @IBOutlet var R_view: UIView!
    @IBOutlet weak var R_collectionView: UICollectionView!
    @IBOutlet weak var width: NSLayoutConstraint!
    @IBOutlet weak var height: NSLayoutConstraint!
    
    var imageArray = [UIImage]()
    var recipeName = [String]()

    let layout = UICollectionViewFlowLayout()

    
        override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        private func commonInit() {
            
            let bundle = Bundle(for: type(of: self))
            bundle.loadNibNamed("RecipeCollectionView", owner: self, options: nil)
            addSubview(R_view)
            
            initCollectionView()
        }
        
        private func initCollectionView() {
            let nib = UINib(nibName: "RecipeCollectionViewCell", bundle: nil)
            R_collectionView.register(nib, forCellWithReuseIdentifier: "RecipeCollectionViewCell")
            R_collectionView.dataSource = self
            R_collectionView.delegate = self
            width.constant = UIScreen.main.bounds.size.width
            height.constant = UIScreen.main.bounds.size.height*0.8
        }
}

    extension RecipeCollectionView: UICollectionViewDataSource, UICollectionViewDelegate{
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

            return imageArray.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCollectionViewCell", for: indexPath) as! RecipeCollectionViewCell
            cell.R_image.image = imageArray[indexPath.row]
            cell.R_Label.text = recipeName[indexPath.row]
            return cell
        }
        
    }

    extension RecipeCollectionView: UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 10)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (collectionView.frame.size.width-30) / 2, height: (collectionView.frame.size.width-30) / 2)
        }
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
                
            return 10
        }
            
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
                
            return 10
        }

}
