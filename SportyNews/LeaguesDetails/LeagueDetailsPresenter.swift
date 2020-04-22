//
//  LeagueDetailsPresenter.swift
//  SportyNews
//
//  Created by Manar Abdelbaset on 4/19/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation

class LeagueDetailsPresenter : LeaguesDetailsPresenterContract{
    func deleteFromLocal(League league: LeagueEntity) {
        if let id = league.leagueID {
        CoreDataHandler.getCoreHandlerInstance().deleteFromEntity(id: id)
            self.controller?.updateFavourite(isSelected: false)
        }
    }
    
    func checkLeagueFavourite(withID id : String) {
        if let val = CoreDataHandler.getCoreHandlerInstance().fetchLeagueById(id: id){
            self.controller?.updateFavourite(isSelected: true)
        }
        else{
            self.controller?.updateFavourite(isSelected: false)
        }
    }
    
    func addLeagueToLocal(League league: LeagueEntity) {
    CoreDataHandler.getCoreHandlerInstance().insertInLocalLeagues(league: league)
        self.controller?.updateFavourite(isSelected: true)
        
    }
    
    var controller : LeaguesDetailsControllerContract?
    func getUpComingEvents(withID id: String) {
        APIURLs.searchEventsKey = id
        NetworkService.INSTANCE.getResponse(withURL: URL(string: "\(APIURLs.latestPastEventsPerLeagueURLString)\(APIURLs.searchEventsKey!)")!, ProcessResult: {
            json in
            let upComingEvents = Mapper.jsonToEventList(fromJson: json)
            self.controller?.displayUpcomingEvents(listOfUpcomingEvents: upComingEvents)
        }
            
            )
    }
    
    func getPastEvents(withID id: String) {
        APIURLs.searchEventsKey = id
        NetworkService.INSTANCE.getResponse(withURL: URL(string: "\(APIURLs.latestPastEventsPerLeagueURLString)\(APIURLs.searchEventsKey!)")!, ProcessResult: {
            json in
            let pastEvents = Mapper.jsonToEventList(fromJson: json)
            self.controller?.displayPastEvents(listOfPastEvents: pastEvents)
            })
    }
    
    func getTeams(withName name: String) {
        APIURLs.searchTeamKey = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        NetworkService.INSTANCE.getResponse(withURL: URL(string: "\(APIURLs.allTeamsPerLeagueURLString)\(APIURLs.searchTeamKey!)")!, ProcessResult: {
            json in
               // print(json)
            let teams = Mapper.jsonToTeamList(fromJson: json)
                teams.forEach({
                team in
                    print("\n\n***\(String(describing: team.teamName)) \(String(describing: team.teamBadge))")
            })
            self.controller?.displayTeams(listOfTeams: teams)
        })
    }
    
    func getAllNeededData(forLeague league: LeagueEntity) {
        getPastEvents(withID: league.leagueID!)
        getUpComingEvents(withID: league.leagueID!)
        getTeams(withName: league.leagueName!)
    }
    
    
}
	
