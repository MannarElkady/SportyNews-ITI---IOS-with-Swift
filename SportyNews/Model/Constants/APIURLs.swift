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
    static let sportString = "https://www.thesportsdb.com/api/v1/json/1/all_sports.php"
    static let leagueSearchString = "https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?s="
    static let teamSearchLeagueString = "https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l="
    static let upcomingEventSearchLeagueString = "https://www.thesportsdb.com/api/v1/json/1/eventsnextleague.php?id="
    static let pastEventSearchLeagueString = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id="
    
    /**Keys**/
    static var searchLeagueKey : String?
    static var searchTeamKey : String?
    static var searchEventsWithLeagueIDKey : String?
    
    /****** URLs******/
    static let sportsURL : URL = URL(string: sportString)!
    
    static let searchUpcomingEventWithLeagueIDURL : URL =  URL(string: "\(upcomingEventSearchLeagueString)\(searchEventsWithLeagueIDKey!)")!
    
    static let searchPastEventWithLeagueIDURL : URL =  URL(string: "\(pastEventSearchLeagueString)\(searchEventsWithLeagueIDKey!)")!
    
    static let searchLeagueWithSportNameURL : URL = URL(string: "\(leagueSearchString)\(searchLeagueKey!)")!
    
    static let searchTeamLeagueURL : URL = URL(string: "\(teamSearchLeagueString)\(searchTeamKey!)")!
    
}

enum JSONObjectMapperTypes{
    case LeagueEntity
    case SportEntity
    case TeamEntity
    case EventEntity
}
