//
//  LeaguesDetailsTableViewCell.swift
//  SportyNews
//
//  Created by Esraa Hassan on 4/19/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit

class LeaguesDetailsTableViewCell: UITableViewCell,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
     @IBOutlet weak var upComingCollectionView: UICollectionView!
    var upComingEvents : Array<EventEntity>?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upComingEvents?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell : UpcomingCollectionCell = upComingCollectionView.dequeueReusableCell(withReuseIdentifier: "upCominCollectiongCell", for: indexPath) as! UpcomingCollectionCell{
            
        }
    }
    

   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


}
