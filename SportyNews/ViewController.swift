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
        
        /*get all sports*/
        // Do any additional setup after loading the view, typically from a nib.
            APIURLs.searchLeagueKey = "Soccer"
        _ = NetworkService.INSTANCE.getResponse(withURL: APIURLs.sportsURL,  ProcessResult: {
            json in let sportArray = Mapper.jsonToSportsList(fromJson: json)
            sportArray.forEach({
                sport in
                print("SportName: \(sport.sportName)")
                })
        })
        
        /*get leagues per sport**/
        NetworkService.INSTANCE.getResponse(withURL: APIURLs.searchLeagueURL, ProcessResult: {
            json in
           // print(json)
            print(json["countrys"].arrayValue.count)
            //Mapper.jsonToLeagueList(fromJson:
            Mapper.jsonToLeagueList(fromJson:
                json["countrys"].arrayValue.filter({
                j in
                print(j)
                return j["strSport"].stringValue == "Soccer"
                }))
            }
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

