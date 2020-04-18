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
    static let teamSearchLeague = "https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l="
    
    /**Keys**/
    static var searchLeagueKey : String?
    static var searchTeamKey : String?
    
    /****** URLs******/
    static let sportsURL : URL = URL(string: sportString)!
    
    static let searchLeagueURL : URL = URL(string: "\(leagueSearchString)\(searchLeagueKey!)")!
    
    static let searchTeamLeagueURL : URL = URL(string: "\(teamSearchLeague)\(searchTeamKey!)")!
    
}

enum JSONObjectMapperTypes{
    case LeagueEntity
    case SportEntity
}
