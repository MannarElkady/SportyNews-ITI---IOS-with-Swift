//
//  APIURLs.swift
//  SportyNews
//
//  Created by Esraa Hassan on 4/18/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
class APIURLs {
    static let sportString = "https://www.thesportsdb.com/api/v1/json/1/all_sports.php"
    static let leagueSearchString = "https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?s="
    static let sportsURL : URL = URL(string: sportString)!
    static var searchLeagueKey: String?
    
    static let searchLeagueURL : URL = URL(string: "\(leagueSearchString)\(searchLeagueKey!)")!
    
}

enum JSONObjectMapperTypes{
    case LeagueEntity
    case SportEntity
}
