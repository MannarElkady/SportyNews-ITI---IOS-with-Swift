//
//  SportEntity.swift
//  SportyNews
//
//  Created by Esraa Hassan on 4/18/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation

class SportEntity{
    init(sportName:String,sportThumb:String) {
        self.sportName = sportName
        self.sportThumb = sportThumb
    }
    init(){
        sportThumb = ""
        sportName = ""
    }
    var sportName : String
    var sportThumb : String
}
