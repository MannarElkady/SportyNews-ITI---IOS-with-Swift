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
    var isFavouriteTab = true
    
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
        print("\n\n\n\n\n\n***")
        presenterLeague.getLeagues()
    }
    override func viewDidAppear(_ animated: Bool) {
        
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
        print("Select item: \((leaguesArray?[indexPath.row])?.leagueID) ")
        let leagueDetails = self.storyboard?.instantiateViewController(withIdentifier: "leagueDetailsViewController") as! LeagueDetailsViewController
        leagueDetails.league = leaguesArray?[indexPath.row]
        self.present(leagueDetails, animated: true, completion: nil)
        }
        else{
            showAlert(Message: "Internet is NOT Available", Details: "Please Connect To Internet to Continue")
        }
    }
    
    func showAlert(Message message : String, Details details : String){
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
            cell.youtubeButton.clipsToBounds =  true
            cell.youtubeButton.setImage(UIImage(named: "youtube"),for: .highlighted)
            cell.youtubeButton.setImage(UIImage(named: "youtube"),for: .normal)
        }
         return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Available Leagues"
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
