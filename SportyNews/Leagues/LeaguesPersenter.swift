//
//  LeaguesPersenter.swift
//  SportyNews
//
//  Created by Manar Abdelbaset on 4/18/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation

class LeaguePresenter : PresenterContract{
    func getLeague(sportName name: String) {
        APIURLs.searchLeagueKey = name
        NetworkService.INSTANCE.getResponse(withURL: APIURLs.searchLeagueWithSportNameURL, ProcessResult: {
            json in
            Mapper.jsonToLeaguesList(fromJson: json).forEach({
                league in
                print((league as! LeagueEntity).leagueName!)
            })
            }
        )
    }
    
    
}
