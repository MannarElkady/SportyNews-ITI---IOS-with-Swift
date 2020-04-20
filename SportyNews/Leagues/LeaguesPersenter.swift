//
//  LeaguesPersenter.swift
//  SportyNews
//
//  Created by Manar Abdelbaset on 4/18/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation

class LeaguePresenter : PresenterContract{
    var controller : ControllerContract?
    func getLeague(sportName name: String) {
        APIURLs.searchLeagueKey = name.split(separator: " ").joined(separator: "%20")
        print(name.split(separator: " ").joined(separator: "%20"))
        NetworkService.INSTANCE.getResponse(withURL:URL(string: "\(APIURLs.leagueSearchString)\(APIURLs.searchLeagueKey!)")!, ProcessResult: {
            json in
            
            let leagueArray = Mapper.jsonToLeaguesList(fromJson: json)
            self.controller?.displayLeagues(LeaguesArray: leagueArray as! Array<LeagueEntity>)
            }
        )
    }
}
