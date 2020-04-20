//
//  PastTableViewCell.swift
//  SportyNews
//
//  Created by Manar Abdelbaset on 4/20/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit

class PastTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var pastEvents : Array<EventEntity>?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return pastEvents?.count
        return 10
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
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 280, height: 180)
        }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : LatestCollectionCell = pastCollectionView.dequeueReusableCell(withReuseIdentifier: "latestCollectionCell", for: indexPath) as! LatestCollectionCell
        cell.firstTeamImageView.image = UIImage(named: "trophy")
        cell.secondTeamImageView.image = UIImage(named: "trophy")
        cell.firstTeamScoreLabel.text = "5"
        cell.secondTeamScoreLabel.text = "4"
        cell.dateTimeLabel.text = "17/4/2018"
        
        return cell
        }

}
