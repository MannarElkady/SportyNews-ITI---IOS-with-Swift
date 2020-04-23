//
//  PastTableViewCell.swift
//  SportyNews
//
//  Created by Manar Abdelbaset on 4/20/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit
import Kingfisher

class PastTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var pastEvents = Array<EventEntity>()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pastEvents.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        return CGSize(width: width, height: 180)
    }
   
        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    
      //  let numberOfSets = CGFloat(self.currentExSets.count)
    
            let width = (pastCollectionView.frame.size.width - ( self.contentView.frame.size.width / 15))///numberOfSets
    
        let height = collectionView.frame.size.height
    
            return CGSize(width: width, height: height);
    }
    
    // UICollectionViewDelegateFlowLayout method
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    
        let cellWidthPadding = collectionView.frame.size.width / 30
        let cellHeightPadding = collectionView.frame.size.height / 4
        return UIEdgeInsets(top: cellHeightPadding,left: cellWidthPadding, bottom: cellHeightPadding,right: cellWidthPadding)
    }
    @IBOutlet weak var pastCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.pastCollectionView.delegate = self
        self.pastCollectionView.dataSource = self
        self.pastCollectionView.register(UINib(nibName: "PastCollectionCell", bundle: nil), forCellWithReuseIdentifier: "latestCollectionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : LatestCollectionCell = pastCollectionView.dequeueReusableCell(withReuseIdentifier: "latestCollectionCell", for: indexPath) as! LatestCollectionCell
        cell.firstTeamImageView.image = UIImage(named: "trophy")
        cell.secondTeamImageView.image = UIImage(named: "trophy")
        cell.firstTeamScoreLabel.text = pastEvents[indexPath.row].firstTeamScore
        cell.secondTeamScoreLabel.text = pastEvents[indexPath.row].secondTeamScore
        cell.firstTeamLabelName.text = pastEvents[indexPath.row].firstTeam?.teamName
        cell.secondTeamNameLabel.text = pastEvents[indexPath.row].secondTeam?.teamName
        cell.dateTimeLabel.text = "Date: \(String(describing: (pastEvents[indexPath.row].eventDate)!)) Time: \(String(describing: (pastEvents[indexPath.row].eventTime)!))"
        return cell
        }

}
