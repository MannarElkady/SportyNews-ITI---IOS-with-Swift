//
//  ViewController.swift
//  SportyNews
//
//  Created by Esraa Hassan on 4/17/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
   
        /*get leagues per sport**/
        NetworkService.INSTANCE.getResponse(withURL: APIURLs.searchLeagueURL, ProcessResult: {
            json in
           // print(json)
            //print(json["countrys"].arrayValue.count)
            //Mapper.jsonToLeagueList(fromJson:
            Mapper.jsonToLeagueList(fromJson:
                json["countrys"].arrayValue.filter({
                j in
              //  print(j)
                return j["strSport"].stringValue == "Soccer"
                }))
            }
        )
        
        //get teams by league name
        
        APIURLs.searchTeamKey = "Albanian Superliga".split(separator: " ").joined(separator: "%20")
        NetworkService.INSTANCE.getResponse(withURL: APIURLs.searchTeamLeagueURL, ProcessResult: {
            json in
               // print(json)
            Mapper.jsonToTeamList(fromJson: json).forEach({
                team in
                print(team.teamName)
            })
        })
        
        APIURLs.searchLeagueKey = "Soccer"
        NetworkService.INSTANCE.getResponse(withURL: APIURLs.searchLeagueURL, ProcessResult: {
            json in
            //print(json)
            Mapper.jsonToLeaguesList(fromJson: json).forEach({
                league in
                print(league.leagueName)
            })
            }
        )

    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

