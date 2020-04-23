//
//  SpotrsProtocols.swift
//  SportyNews
//
//  Created by Esraa Hassan on 4/18/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation

protocol SportPresenterProtocol {
    func getSports()
}

protocol SportsViewProtocol {
    func showSports(sports:Array<SportEntity>)
}
