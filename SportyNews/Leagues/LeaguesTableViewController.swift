//
//  LeaguesTableViewController.swift
//  SportyNews
//
//  Created by Manar Abdelbaset on 4/18/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit
import Kingfisher

class LeaguesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,
ControllerContract {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var sportNameTextField: UILabel!
    var sportName: String?
    var isFavouriteTab : Bool?
    
    var leaguesArray: Array<LeagueEntity>?
    
    var presenterLeague = LeaguePresenter()
    
    func displayLeagues(LeaguesArray array: Array<LeagueEntity>) {
        leaguesArray?.removeAll()
        leaguesArray = array
        tableView.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenterLeague.controller = self
        if let name = sportName {
            self.sportNameTextField?.text = sportName
        } else { self.sportNameTextField?.text = "Favourite Sports"}
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        presenterLeague.getLeagues()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let count = leaguesArray?.count
        else{
            return 0
        }
        return leaguesArray!.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(self.presenterLeague.checkAvailability()){
        let leagueDetails = self.storyboard?.instantiateViewController(withIdentifier: "leagueDetailsViewController") as! LeagueDetailsViewController
            leagueDetails.league = leaguesArray?[indexPath.row]
            self.present(leagueDetails, animated: true, completion: nil)
        }
        else{
            showAlert(Message: "Internet is NOT Available", Details: "Please Connect To Internet to Continue")
        }
    }
    
    @objc func showAlert(Message message : String, Details details : String){
        let alert = UIAlertController(title: message, message: details, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell", for: indexPath) as! LeaguesTableViewCell
        if (leaguesArray?.count) != nil{
           
            cell.leagueNameTextView.text = leaguesArray?[indexPath.row].leagueName
            cell.logoLeagueImageView.layer.cornerRadius = cell.logoLeagueImageView.frame.size.width/2
              cell.logoLeagueImageView.clipsToBounds = true
            cell.logoLeagueImageView.kf.setImage(with: URL(string: (leaguesArray?[indexPath.row].leagueBadge)!))
            cell.league = leaguesArray?[indexPath.row]
            NotificationCenter.default.addObserver(self, selector: #selector(displayNoLink), name: NSNotification.Name("displayNoLink"), object: nil)
            cell.youtubeButton.clipsToBounds =  true
            cell.youtubeButton.setImage(UIImage(named: "youtube"),for: .highlighted)
            cell.youtubeButton.setImage(UIImage(named: "youtube"),for: .normal)
        }
         return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Available Leagues"
    }
    
    @objc func displayNoLink (notification: Notification){
        let leag = notification.object as! LeagueEntity
    showAlert(Message: "Sorry",Details: "No link Available for \(leag.leagueName!) League")
    }
}
