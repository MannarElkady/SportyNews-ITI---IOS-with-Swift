//
//  LeaguesDetailsTableViewCell.swift
//  SportyNews
//
//  Created by Manar Abdelbaset on 4/19/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit

    
class UpcomingTableViewCell: UITableViewCell ,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    //view

 @IBOutlet weak var upComingCollectionView: UICollectionView!
var upComingEvents = Array<EventEntity>()

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return upComingEvents.count
   // return 10
}
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.upComingCollectionView.delegate = self
        self.upComingCollectionView.dataSource = self
      //  self.upComingCollectionView.d
        self.upComingCollectionView.register(UINib(nibName: "UpcomingCollectionCell", bundle: nil), forCellWithReuseIdentifier: "upcomingCollectionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        print("From Upcoming table cell")

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 260, height: 145)
    }
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell : UpcomingCollectionCell = upComingCollectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCollectionCell", for: indexPath) as! UpcomingCollectionCell
        	
    cell.eventNameLabel?.text = upComingEvents[indexPath.row].eventName
    cell.eventDateLabel?.text = upComingEvents[indexPath.row].eventDate
    cell.eventTimeLabel?.text = upComingEvents[indexPath.row].eventTime
    
    return cell
    }
    
    
}
