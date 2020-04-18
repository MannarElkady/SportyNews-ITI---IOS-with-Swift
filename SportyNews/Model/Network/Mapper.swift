//
//  Mapper.swift
//  SportyNews
//
//  Created by Esraa Hassan on 4/18/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
import SwiftyJSON

class Mapper{
    public static func jsonToSportsList(fromJson json: JSON) -> Array<SportEntity>{
        var sportArray = Array<SportEntity>()
        let customarray = json["sports"].arrayValue
        customarray.forEach({ json in
            let sport = SportEntity()
            sport.sportName = json["strSport"].stringValue
            print(sport.sportName)
            sport.sportThumb = json["strSportThumb"].stringValue
            print(sport.sportName)
            sportArray.append(sport)
        })
        return sportArray
    }
    
    public static func jsonToLeagueList(fromJson jsonArray: [JSON]) -> Array<LeagueEntity>{
        var leagueArray = Array<LeagueEntity>()
        //let customarray = json["countrys"].arrayValue
        jsonArray.forEach({ json in
            let league = LeagueEntity()
            league.leagueBadge = json["strBadge"].stringValue
            print(league.leagueBadge)
            league.leagueName = json["strLeague"].stringValue
            print(league.leagueName)
            league.leagueVideoLink = json["strYoutube"].stringValue
            print(league.leagueVideoLink)
            leagueArray.append(league)
        })
        return leagueArray
    }
}
