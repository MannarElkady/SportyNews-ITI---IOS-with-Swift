//
//  SportsPersenter.swift
//  SportyNews
//
//  Created by Esraa Hassan on 4/18/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
class SportsPersenter:SportPresenterProtocol{
    let sportsview:SportsViewProtocol
    
    init(sportsview:SportsViewProtocol) {
        self.sportsview = sportsview
    }
    
    func getSports() {
        NetworkService.INSTANCE.getResponse(withURL: APIURLs.sportsURL,  ProcessResult: {
            json in let sportArray = Mapper.jsonToSportsList(fromJson: json)
            sportArray.forEach({
                sport in
                print("SportName: \(sport.sportName)")
            })
            self.sportsview.showSports(sports: sportArray)
        })

    }
}
