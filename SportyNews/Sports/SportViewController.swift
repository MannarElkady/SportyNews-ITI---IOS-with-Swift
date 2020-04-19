//
//  SportViewController.swift
//  SportyNews
//
//  Created by Esraa Hassan on 4/18/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit
import Kingfisher

//private let reuseIdentifier = "Cell"

class SportViewController: UICollectionViewController ,SportsViewProtocol{
    var sportsList:Array<SportEntity>?
    var sportPersenter:SportsPersenter?
    
    func showSports(sports: Array<SportEntity>) {
        sportsList = sports
        print((sportsList?.count)!)
        self.collectionView?.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        sportsList = Array<SportEntity>()
        sportPersenter = SportsPersenter(sportsview: self)
        sportPersenter?.getSports()
     

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes


        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
       //showSports(sports: sportsList!)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if(((sportsList?.count)!)==0||(sportsList?.count)!==nil){
        
            return 0

        }
        else{
        return (sportsList?.count)!
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SportsCollectionViewCell
        if(((sportsList?.count)!)==0||(sportsList?.count)!==nil){
            
        }
        else
        {
            cell.sportName.text = sportsList?[indexPath.row].sportName
        
            let imageUrl = URL(string: (sportsList?[indexPath.row].sportThumb)!)
            cell.sportImage.kf.setImage(with: imageUrl)

        }
        

        // Configure the cell
    
        return cell
    }
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let headerview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath as IndexPath)as! SportsCollectionReusableView
            headerview.header.text="Sports"
                if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionHeadersPinToVisibleBounds = true
            layout.headerReferenceSize = CGSize(width: 10, height: 100)
        }
        return headerview
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = view.frame.size.height
        let width = view.frame.size.width
        return CGSize(width: width * 0.5, height: height * 0.2)
    }
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    
     //Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        print("\(sportsList![indexPath.row].sportName)")
        let leagueStoryBoard = UIStoryboard(name: "LeaguesStoryboard", bundle: nil)
        let leagueViewController = leagueStoryBoard.instantiateViewController(withIdentifier: "leaguesTableViewController") as! LeaguesTableViewController
        leagueViewController.sportName = sportsList?[indexPath.row].sportName
        self.present(leagueViewController, animated: true, completion: nil)
        return true
    }
 

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
