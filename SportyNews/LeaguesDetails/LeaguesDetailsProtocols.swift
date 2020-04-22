//
//  LeaguesDetailsProtocols.swift
//  SportyNews
//
//  Created by Manar Abdelbaset on 4/18/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation

protocol LeaguesDetailsPresenterContract {
    func getUpComingEvents(withID id: String)
    func getPastEvents(withID id: String)
    func getTeams(withName name: String)
    func getAllNeededData(forLeague league: LeagueEntity)
    func addLeagueToLogal(League league: LeagueEntity)
}

protocol LeaguesDetailsControllerContract {
    func displayUpcomingEvents(listOfUpcomingEvents events: Array<EventEntity>)
    func displayPastEvents(listOfPastEvents events: Array<EventEntity>)
    func displayTeams(listOfTeams teams: Array<TeamEntity>)
    func updateFavourite()
}
