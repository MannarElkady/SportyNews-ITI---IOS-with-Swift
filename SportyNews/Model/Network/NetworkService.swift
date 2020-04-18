//
//  NetworkService.swift
//  SportyNews
//
//  Created by Manar on 4/18/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class NetworkService{
    static let INSTANCE = NetworkService()
    private init(){
    }
    
    private func generateOperationQueue(){
        
    }
    func getResponse(withURL url : URL,ProcessResult onComplete: @escaping (JSON) -> ()){
        var json : JSON?
        Alamofire.request(url).validate()
            .responseJSON(completionHandler: {
            dataResponse in
        switch dataResponse.result{
            case .success(let value):
                json = JSON(value)
                //let customarray = json?["sports"].arrayValue
                //print(customarray?.first)
                onComplete(json!)
            case .failure(let error):
                print(error)
            }
        })
    }
}
