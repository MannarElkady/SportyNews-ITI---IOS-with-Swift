//
//  LeagueDetailsViewController.swift
//  SportyNews
//
//  Created by Manar Abdelbaset on 4/19/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit

class LeagueDetailsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, LeaguesDetailsControllerContract {
    func displayUpcomingEvents(listOfUpcomingEvents events: Array<EventEntity>) {
        self
    }
    
    func displayPastEvents(listOfPastEvents events: Array<EventEntity>) {
        <#code#>
    }
    
    func displayTeams(listOfTeams teams: Array<TeamEntity>) {
        <#code#>
    }
    
    
    let presenter = LeagueDetailsPresenter()
    
    @IBOutlet weak var leagueNameLabel: UILabel!
    
    @IBAction func leagueFavouriteButtonAction(_ sender: UIButton) {
    }
    var league : LeagueEntity?
    @IBOutlet weak var tableView: UITableView!
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch(indexPath.section){
            case 0:
                return 175
            case 1:
                return 225
            case 2:
                return 100
            default:
                break
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(section) {
        case 0:
            return "Upcoming Events"
        case 1:
            return "Latest Past Events"
        case 2:
            return "League Teams"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        switch(indexPath.section){
            case 0:
                cell  = (self.tableView.dequeueReusableCell(withIdentifier: "upComingCell") as? UpcomingTableViewCell)!
            case 1:
                cell  = (self.tableView.dequeueReusableCell(withIdentifier: "pastCell") as? PastTableViewCell)!
            case 2:
                cell  = (self.tableView.dequeueReusableCell(withIdentifier: "teamsCell") as? TeamsTableViewCell)!
            default:
                break
        }
        
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.controller = self
        leagueNameLabel.text = league?.leagueName
        // Do any additional setup after loading the view.
        presenter.getAllNeededData(forLeague: league!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
