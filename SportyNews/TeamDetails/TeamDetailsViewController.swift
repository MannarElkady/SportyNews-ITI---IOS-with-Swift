//
//  TeamDetailsViewController.swift
//  SportyNews
//
//  Created by Esraa Hassan on 4/19/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit
import Kingfisher

class TeamDetailsViewController: UIViewController {


    
    
    @IBOutlet var teamPoster: UIImageView!
    @IBOutlet var teamName: UILabel!
    
    @IBOutlet var teamSport: UILabel!
    @IBOutlet var teamCountry: UILabel!
    public var TeamDetails:TeamEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpeg")!)
        TeamDetails = TeamEntity()
        TeamDetails?.teamName = "Flamurtari Vlorë"
        TeamDetails?.teamSport = "Soccer"
        TeamDetails?.teamCountry = "Albania"
        TeamDetails?.teamBadge = "https://www.thesportsdb.com//images//media//team//badge//pvxcv21513620873.png"
       
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if(TeamDetails != nil){
            teamName.text = TeamDetails?.teamName
            teamCountry.text = TeamDetails?.teamCountry
            teamSport.text = TeamDetails?.teamSport
            let imageUrl = URL(string:(TeamDetails?.teamBadge)!)
            teamPoster.kf.setImage(with: imageUrl)

    }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
