//
//  LeaguesProtocols.swift
//  SportyNews
//
//  Created by Manar Abdelbaset on 4/18/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation


protocol PresenterContract {
    func getLeague(sportName name: String)
}

protocol ControllerContract {
    var sportName : String? { get set }
    func displayLeagues(LeaguesArray array: Array<LeagueEntity>)
}
