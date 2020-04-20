//
//  TeamTableViewCell.swift
//  SportyNews
//
//  Created by Manar Abdelbaset on 4/20/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit

class TeamsTableViewCell: UITableViewCell ,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var teamsCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.teamsCollectionView.delegate = self
        self.teamsCollectionView.dataSource = self
        self.teamsCollectionView.register(UINib(nibName: "TeamsCollectionCell", bundle: nil), forCellWithReuseIdentifier: "teamsCollectionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return pastEvents?.count
        return 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 280, height: 180)
        }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : TeamsCollectionCell = teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "teamsCollectionCell", for: indexPath) as! TeamsCollectionCell
        cell.teamImageView.image = UIImage(named: "trophy")
        return cell
        }

}
