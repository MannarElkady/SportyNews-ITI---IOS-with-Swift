//
//  TeamTableViewCell.swift
//  SportyNews
//
//  Created by Manar Abdelbaset on 4/20/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit

class TeamsTableViewCell: UITableViewCell ,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var teamsArray = Array<TeamEntity>()
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.teamsCollectionView.delegate = self
        self.teamsCollectionView.dataSource = self
        self.teamsCollectionView.register(UINib(nibName: "TeamsCollectionCell", bundle: nil), forCellWithReuseIdentifier: "teamsCollectionCell")
        teamsCollectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("teamsArray \(String(describing: teamsArray.count))")
       // if let c = teamsArray.count {
            return teamsArray.count
       // }
      //  return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
       // let teamViewController = mainStoryBoard.instantiateViewController(withIdentifier: "teamDetailsViewController") as! TeamDetailsViewController
        //teamViewController.teamDetails = teamsArray[indexPath.row]
       // self.present(teamViewController, animated: true, completion: nil)
        
        //Using Notification Center to send data
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name(rawValue: "callTeamDetails"), object: teamsArray[indexPath.row], userInfo: nil)
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
    }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 80, height: 80)
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : TeamsCollectionCell = teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "teamsCollectionCell", for: indexPath) as! TeamsCollectionCell
        cell.teamImageView.kf.setImage(with: URL(string: (teamsArray[indexPath.row].teamBadge)!))
        return cell
        }

}
