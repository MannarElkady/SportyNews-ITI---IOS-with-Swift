//
//  LeagueDetailsPresenter.swift
//  SportyNews
//
//  Created by Manar Abdelbaset on 4/19/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation

class LeagueDetailsPresenter : LeaguesDetailsPresenterContract{
    var controller : LeaguesDetailsControllerContract?
    func getUpComingEvents(withID id: String) {
        APIURLs.searchEventsWithLeagueIDKey = id
        NetworkService.INSTANCE.getResponse(withURL: URL(string: "\(APIURLs.pastEventSearchLeagueString)\(APIURLs.searchEventsWithLeagueIDKey!)")!, ProcessResult: {
            json in
            //print(json)
            let upComingEvents = Mapper.jsonToEventList(fromJson: json)
            /*upComingEvents.forEach({
                event in
                print(event.eventName!)
                print(event.eventTime!)
                print(event.eventDate!)
                print(event.firstTeam?.teamName!)
                print(event.secondTeam?.teamName!)
                print(event.firstTeamScore!)
            })*/
            self.controller?.displayUpcomingEvents(listOfUpcomingEvents: upComingEvents)
        }
            
            )
    }
    
    func getPastEvents(withID id: String) {
        APIURLs.searchEventsWithLeagueIDKey = id
        NetworkService.INSTANCE.getResponse(withURL: URL(string: "\(APIURLs.pastEventSearchLeagueString)\(APIURLs.searchEventsWithLeagueIDKey!)")!, ProcessResult: {
            json in
            //print(json)
            let pastEvents = Mapper.jsonToEventList(fromJson: json)
                /*pastEvents.forEach({
                event in
                print(event.eventName!)
                print(event.eventTime!)
                print(event.eventDate!)
                print(event.firstTeam?.teamName!)
                print(event.firstTeamScore!)
            })*/
            self.controller?.displayPastEvents(listOfPastEvents: pastEvents)
            })
    }
    
    func getTeams(withName name: String) {
        APIURLs.searchTeamKey = name.split(separator: " ").joined(separator: "%20")
        NetworkService.INSTANCE.getResponse(withURL: URL(string: "\(APIURLs.teamSearchLeagueString)\(APIURLs.searchTeamKey!)")!, ProcessResult: {
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
	
