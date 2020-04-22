//
//  LeaguesPersenter.swift
//  SportyNews
//
//  Created by Manar Abdelbaset on 4/18/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation

class LeaguePresenter : PresenterContract, AvaialbilityProtocol{
    func checkAvailability() -> Bool {
        return Reachability.Connection()
    }
    
    func getLeagues() {
        if(checkAvailability()){
            if((!(self.controller as! LeaguesTableViewController).isFavouriteTab)){
                getLeagueFromNetwork()
                (self.controller as! LeaguesTableViewController).isFavouriteTab = true
            }
            else {
                getFavouriteLeagues()
                
            }
        }
    }
    
    var controller : ControllerContract?
    
    func getLeagueFromNetwork() {
        APIURLs.searchLeagueKey = self.controller?.sportName?.split(separator: " ").joined(separator: "%20")
        //print(name.split(separator: " ").joined(separator: "%20"))
        NetworkService.INSTANCE.getResponse(withURL:URL(string: "\(APIURLs.allLeaguesForSportURLString)\(APIURLs.searchLeagueKey!)")!, ProcessResult: {
            json in
            
            let leagueArray = Mapper.jsonToLeaguesList(fromJson: json)
            self.controller?.displayLeagues(LeaguesArray: leagueArray as! Array<LeagueEntity>)
            }
        )
    }
    
    func getFavouriteLeagues() {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async{
            let faveLeagues = CoreDataHandler.getCoreHandlerInstance().getFavouriteLeagues()
            
            DispatchQueue.main.async {
                self.controller?.displayLeagues(LeaguesArray: faveLeagues)
            }
    }
    
    }
}
