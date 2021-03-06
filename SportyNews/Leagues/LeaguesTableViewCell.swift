//
//  LeaguesTableViewCell.swift
//  SportyNews
//
//  Created by Esraa Hassan on 4/18/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    @IBOutlet weak var youtubeButton: UIButton!
    var league : LeagueEntity?
    @IBOutlet weak var leagueNameTextView: UILabel!
    @IBOutlet weak var logoLeagueImageView: UIImageView!
    
    @IBAction func youtubeButtonAction(_ sender: UIButton) {
        if (!(league?.leagueVideoLink!)!.isEmpty) {
        let appURL = URL(string: "https://\((league?.leagueVideoLink)!)")!
        let webURL = URL(string: "https://\((league?.leagueVideoLink)!)")!
            let application = UIApplication.shared
            print(webURL.absoluteString)
            if application.canOpenURL(appURL) {
                application.open(appURL)
            } else {
                // if Youtube app is not installed, open URL inside Safari
                application.open(webURL)
            }
        }
        else{
            NotificationCenter.default.post(name: NSNotification.Name("displayNoLink"), object: league)
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
