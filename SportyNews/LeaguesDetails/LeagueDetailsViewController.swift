//
//  LeagueDetailsViewController.swift
//  SportyNews
//
//  Created by Manar Abdelbaset on 4/19/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit

class LeagueDetailsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, LeaguesDetailsControllerContract {
    
    var league : LeagueEntity?
    var teamsList = Array<TeamEntity>()
    
    @IBOutlet weak var tableView: UITableView!
    
    func displayUpcomingEvents(listOfUpcomingEvents events: Array<EventEntity>) {

        if let indexes = self.tableView.indexPathsForVisibleRows{
            if indexes.contains(IndexPath(row: 0, section: 0)) {
                (self.tableView?.cellForRow(at: IndexPath(row: 0, section: 0)) as! UpcomingTableViewCell).upComingEvents = events
                (self.tableView?.cellForRow(at: IndexPath(row: 0, section: 0)) as! UpcomingTableViewCell).upComingCollectionView.reloadData()
            }
        }else {
            return
            }
        }
    
    func displayPastEvents(listOfPastEvents events: Array<EventEntity>) {
        print("display past events")
        let pastCell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as? PastTableViewCell
        pastCell?.pastEvents = events
        pastCell?.pastCollectionView?.reloadData()
    }
    
    func displayTeams(listOfTeams teams: Array<TeamEntity>) {
        teamsList = teams
        if let indexes = self.tableView.indexPathsForVisibleRows{
            if indexes.contains(IndexPath(row: 0, section: 2)) {
                (self.tableView?.cellForRow(at: IndexPath(row: 0, section: 2)) as! TeamsTableViewCell).teamsArray = teams
                (self.tableView?.cellForRow(at: IndexPath(row: 0, section: 2)) as! TeamsTableViewCell).teamsCollectionView.reloadData()
            }
        }else {
            return
        }
            //indexes.contains {$0.section == 2 && $0.row == 0 }
        /*if (teams.count != 0) {
            (self.tableView?.cellForRow(at: IndexPath(row: 0, section: 2)) as! TeamsTableViewCell).teamsArray = teams
            (self.tableView?.cellForRow(at: IndexPath(row: 0, section: 2)) as! TeamsTableViewCell).teamsCollectionView.reloadData()
        }*/
    }
    
    
    let presenter = LeagueDetailsPresenter()
    
    @IBOutlet weak var leagueNameLabel: UILabel!
    
    @IBAction func leagueFavouriteButtonAction(_ sender: UIButton) {
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch(indexPath.section){
            case 0:
                return 145
            case 1:
                return 180
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
        var cell: UITableViewCell?

        switch(indexPath.section){
            case 0:
                cell  = (self.tableView.dequeueReusableCell(withIdentifier: "upComingCell") as! UpcomingTableViewCell)
                break
            case 1:
                cell  = (self.tableView.dequeueReusableCell(withIdentifier: "pastCell") as! PastTableViewCell)
                break
            case 2:
                cell  = (self.tableView.dequeueReusableCell(withIdentifier: "teamsCell") as! TeamsTableViewCell)
                if(teamsList.count != 0){
                    print("*****************\n\nteam list is availabl")
                }
                break
        default:
            cell = UITableViewCell()
            break
        }
        return cell!
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if(indexPath.row == 0 && indexPath.section==2){
            print("Inside will display for row 2")
            (cell as! TeamsTableViewCell).teamsArray = teamsList
            print("\(teamsList) \((cell as! TeamsTableViewCell).teamsArray)")
             (cell as! TeamsTableViewCell).teamsCollectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.controller = self
        leagueNameLabel.text = league?.leagueName
        // Do any additional setup after loading the view.
        presenter.getAllNeededData(forLeague: league!)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.done, target: self, action: #selector(returnToLeagues))
    }

    @objc func returnToLeagues(){
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
