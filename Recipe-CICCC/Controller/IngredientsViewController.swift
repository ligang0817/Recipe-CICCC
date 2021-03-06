//
//  IngredientsViewController.swift
//  Recipe-CICCC
//
//  Created by fangyilai on 2020-02-12.
//  Copyright © 2020 Argus Chen. All rights reserved.
//

import UIKit

class IngredientsViewController: UIViewController {
    @IBOutlet weak var TitleCollectionView: UICollectionView!
    @IBOutlet weak var ImageCollecitonVIew: UICollectionView!
    
    var ingridentArray = [String]()
    var imageArray = [UIImage]()
    var recipeName = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingridentArray = ["Tomato","Beef","Egg","Broccoli","Carrot","Onion","Test for length"]
        imageArray = [#imageLiteral(resourceName: "huevos-rancheros"),#imageLiteral(resourceName: "2018_Sweet-Sallty-Snack-Mix_5817_600x600"),#imageLiteral(resourceName: "Lemon-Garlic-Butter-Salmon-with-Zucchini-Noodles-recipes"),#imageLiteral(resourceName: "candied-yams-5"),#imageLiteral(resourceName: "best-salad-7"),#imageLiteral(resourceName: "guacamole-foto-heroe-1024x723"),#imageLiteral(resourceName: "huevos-rancheros"),#imageLiteral(resourceName: "How-to-Make-the-Best-Juiciest-Turkey-Meatballs_055"),#imageLiteral(resourceName: "Intrepid-Travel-Taiwan-dumplings-Xiao-Long-Bao_577219075"),#imageLiteral(resourceName: "guacamole-foto-heroe-1024x723")]
        recipeName = ["Title:\nCreator:","Title:\nCreator:","Title:\nCreator:","Title:\nCreator:","Title:\nCreator:","Title:\nCreator:","Title:\nCreator:","Title:\nCreator:","Title:\nCreator:","It's a test for auto-shrink!!!!!!!!!!!!"]
        // Do any additional setup after loading the view.
        
    }
    
}

extension IngredientsViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == TitleCollectionView{
            return ingridentArray.count
        }
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == TitleCollectionView{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ingredientTitleCell", for: indexPath) as! IngredientTitleCollectionViewCell
            cell.ingredient.text = ingridentArray[indexPath.row]
            if let view = cell.titleView{
                roundCorners(view: view, cornerRadius: 8.0)
            }
            return cell
        }
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ingredientImageCell", for: indexPath) as! IngredientImageCollectionViewCell
        cell2.ingredientRecipeImage.image = imageArray[indexPath.row]
        cell2.ingredientRecipeName.text = recipeName[indexPath.row]
        return cell2
    }
    
}

extension IngredientsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == TitleCollectionView{
            return CGSize(width: 65, height: 30)
        }
        //return CGSize(width: (collectionView.bounds.width-20) / 2, height: 170)
        return CGSize(width: (collectionView.frame.size.width-30) / 2, height: (collectionView.frame.size.width-30) / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            
        return 10
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            
        return 10
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//
//        return 4
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//
//        return 1
//    }
//
    
    
    
    
    
   func roundCorners(view: UIView, cornerRadius: Double) {
             view.layer.cornerRadius = CGFloat(cornerRadius)
             view.clipsToBounds = true
   }
}
