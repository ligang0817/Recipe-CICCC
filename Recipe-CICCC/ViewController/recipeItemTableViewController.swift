//
//  recipeItemTableViewController.swift
//  RecipeTest
//
//  Created by 北島　志帆美 on 2019-11-27.
//  Copyright © 2019 北島　志帆美. All rights reserved.
//

import UIKit


class recipeItemTableViewController: UITableViewController {
    

    
    var item = RecipeItem()
    var indexPath = IndexPath()
//
//    let identifiers = [1: "recipeMainCell", 2:"iconItem", 3:"creatorCellRecpipe", 4:"ingredients", 5: "how to cook"]

    var numImg = CGFloat(2.0) // depends on how many pictures user want to use, it is gonna change.
    
    let ingredients = IngredientsList()
    let HowToCookList = howToCookList()
    
    var currentPage:Int = 0

   
       
       override func viewDidLoad() {
           super.viewDidLoad()
        let cell: recipeMainTableViewCell = (tableView.dequeueReusableCell(withIdentifier:"recipeMainCell") as? recipeMainTableViewCell)!
        
           // Do any additional setup after loading the view.
        
        
       }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let cell: recipeMainTableViewCell = (tableView.dequeueReusableCell(withIdentifier:"recipeMainCell") as? recipeMainTableViewCell)!
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 7
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0, 1, 2, 3, 4:
            return 1
        case 5:
            return  ingredients.ingredientsList.count// this is for the number of ingredients
        case 6:
            return HowToCookList.howToCookList.count // this shows how to cook.
        default:
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 400
        case 3:
            return 45  // this is for the number of ingredients
        case 4:
            return 78 // this shows how to cook.
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 1 || section == 2 || section == 3 || section == 4 {
            return 0.0
        }
        else {
            return 40.0
        }
    }
    
//    @objc fileprivate func didChangePage(_ currentProgress: Int, _ numberOfPages: Int, _ direction: recipeItemTableViewController.Direction) {
//        if currentProgress == numberOfPages - 1 {
//            direction = .left
//        }
//        else if currentProgress == 0 {
//            direction = .right
//        }
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        if indexPath.section == 0 {
            let cell : recipeMainTableViewCell =  (tableView.dequeueReusableCell(withIdentifier:"recipeMainCell") as? recipeMainTableViewCell)!
            
            
            
            //let _ = RecipeListCreator.creatorRecipeLists[indexPath.row]
            
            
            
            return cell
            
        }
        else if indexPath.section == 1 {
            let cell: titleTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "title") as? titleTableViewCell)!
           
            cell.titleLabel.text = item.recipeName
            
            return cell
        }
            
        else if indexPath.section == 2 {
            
            let cell: explanationTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "explanation") as? explanationTableViewCell)!
            
//            cell.explanationLabel.text = "Brussels sprouts are one of the most underrated vegetables. These cruciferous green gems are good for you and, when cooked correctly, so darn delicious. Still not sure? We’ve rounded up a few recipes that prove it!"
            
            cell.timeLabel.text = item.recipeExplanation
            
            
//            cell.explanationLabel.sizeToFit()
//                       cell.heightForLabel.constant =  cell.explanationLabel.frame.size.height
            return cell
        }
        else if indexPath.section == 3 {
            let cell: iconItemTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "iconItem") as? iconItemTableViewCell)!
            
            cell.numLikeLabel.text = String(item.numOfLike)
            
            return cell
            
        }
        else if indexPath.section == 4 {
            let cell: creatorCellRecpipeTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "creatorCellRecpipe") as? creatorCellRecpipeTableViewCell)!
            
            cell.creatorNameLabel.text = item.creator
            return cell
        }
        else if indexPath.section == 5 {
            let cell: IngredientsTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "ingredients") as? IngredientsTableViewCell)!
            
            let _ = ingredients.ingredientsList[indexPath.row]
            
            cell.ingredientsNameLabel.text =  ingredients.ingredientsList[indexPath.row].ingredientName
            cell.amountIngredientsLabel.text = ingredients.ingredientsList[indexPath.row].amountIngredient
            return cell
        } else {
        
            let cell: HowToCookTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "how to cook") as? HowToCookTableViewCell)!
            
            let _ = HowToCookList.howToCookList[indexPath.row]
            
            cell.howToCookLabel.text =  HowToCookList.howToCookList[indexPath.row].howToCook
            cell.howToCookLabel.text = HowToCookList.howToCookList[indexPath.row].howToCook
            
            return cell
        
    }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel(frame: CGRect(x: 10, y: 0, width:
        tableView.bounds.size.width, height: 28))
        headerLabel.textColor = UIColor.black
        
        headerLabel.textAlignment = .left
        
        
        let view:UIView = UIView(frame: CGRect(x: 0,y: 0,width: self.tableView.frame.size.width,height: 40.0))
        if section == 0 || section == 1 || section == 2 || section == 3 || section == 4{
            return view
        }
        else if section == 5 {
            view.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.768627451, blue: 0.4431372549, alpha: 1)
            // how can I set color of text?
        
            view.addSubview(headerLabel)
            headerLabel.text = "Ingredients"
            headerLabel.sizeToFit()
            headerLabel.textColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            headerLabel.frame.origin.y = view.frame.size.height/2-headerLabel.frame.size.height/2
            //headerLabel.frame.origin.y = view.frame.size.height/2
            //view.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor).isActive = true
            return view
        }
        else if section == 6 {
            view.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.768627451, blue: 0.4431372549, alpha: 1)
            // how can I set color of text?
        
            view.addSubview(headerLabel)
            headerLabel.text = "How to Cook"
            headerLabel.sizeToFit()
            headerLabel.textColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            headerLabel.frame.origin.y = view.frame.size.height/2-headerLabel.frame.size.height/2
            //headerLabel.frame.origin.y = view.frame.size.height/2
            //view.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor).isActive = true
            return view
        }
        
        return view
    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension recipeItemTableViewController {
    
    override func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        print("")
    }
    
    
}
