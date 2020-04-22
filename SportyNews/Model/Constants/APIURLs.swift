//
//  APIURLs.swift
//  SportyNews
//
//  Created by Manar on 4/18/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation

class APIURLs {
    
    
    /****** Strings URL******/
    static let allSportsURLString = "https://www.thesportsdb.com/api/v1/json/1/all_sports.php"
    static let allLeaguesForSportURLString = "https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?s="
    static let allTeamsPerLeagueURLString = "https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l="
    static let latestUpComingEventsPerLeagueURLString = "https://www.thesportsdb.com/api/v1/json/1/eventsnextleague.php?id="
    static let latestPastEventsPerLeagueURLString = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id="
    
    /**Keys**/
    static var searchLeagueKey : String?
    static var searchTeamKey : String?
    static var searchEventsKey : String?
    
    /****** URLs******/
    static let sportsURL : URL = URL(string: allSportsURLString)!
    
}

enum JSONObjectMapperTypes{
    case LeagueEntity
    case SportEntity
    case TeamEntity
    case EventEntity
}
