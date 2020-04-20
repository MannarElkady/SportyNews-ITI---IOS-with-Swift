//
//  LocalDataStore.swift
//  SportyNews
//
//  Created by Esraa Hassan on 4/19/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class CoreDataHandler{
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private  var managedContext:NSManagedObjectContext?
    private static var instance = CoreDataHandler()
    
    private init () {
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    static func getCoreHandlerInstance() -> CoreDataHandler {
        return instance
}
    func insertLeague(league leagueValue:LeagueEntity) -> NSManagedObject {
        let entity = NSEntityDescription.entity(forEntityName: "FavouriteLeague", in: managedContext!)
        
        let league = prepareNSManagedObject(leagueValue: leagueValue, entity: entity!)
        
        do{
            try managedContext!.save()
        }
        catch{
            print("error in insertInLocalMovies")
        }
        return league
    }

    
    func getFavouriteLeague() -> Array<LeagueEntity>{
        return fetchData(entityName: "FavouriteLeague")
    }
    
    

    func deleteFromEntity(league leagueValue:LeagueEntity){
        let entity = NSEntityDescription.entity(forEntityName: "FavouriteLeague", in: managedContext!)
        
        let deletedLeague = prepareNSManagedObjectDeletion(leagueValue: leagueValue, entity: entity!)

        managedContext?.delete(deletedLeague)
        do{
            try managedContext?.save()
        }
        catch{
            print("error in deleteFromEntity")
        }
    }
    
    private func fetchData(entityName:String) -> Array<LeagueEntity>{
        var leaguesArray = Array<LeagueEntity>()
        var leagues = Array<NSManagedObject>()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        
        do{
            leagues = try managedContext!.fetch(fetchRequest)
        }
        catch{
            print("error in fetchData")
        }
        for item in leagues {
           let leageName = item.value(forKey: "leagueName") as! String
            let leageThmap = item.value(forKey: "leagueThump") as! String
            let leageYoutube = item.value(forKey: "leagueYoutube") as! String
            let leagueId = item.value(forKey: "leagueID") as! String
            let  league = LeagueEntity()
            league.leagueName = leageName
            league.leagueBadge = leageThmap
            league.leagueVideoLink = leageYoutube
            league.leagueID = leagueId
            leaguesArray.append(league)
        }
        
        
        
        return leaguesArray
    }
    
    private func prepareNSManagedObject(leagueValue:LeagueEntity,entity :NSEntityDescription) -> NSManagedObject{
        
        let league = NSManagedObject(entity: entity, insertInto: managedContext!)
        league.setValue(leagueValue.leagueName, forKey: "leagueName")
        league.setValue(leagueValue.leagueBadge, forKey: "leagueThump")
        league.setValue(leagueValue.leagueVideoLink, forKey: "leagueYoutube")
        league.setValue(leagueValue.leagueID, forKey: "leagueID")
        
        return league
    }
    
    private func prepareNSManagedObjectDeletion(leagueValue:LeagueEntity,entity :NSEntityDescription) -> NSManagedObject{
        
        let league = NSManagedObject(entity: entity, insertInto: nil)
        league.setValue(leagueValue.leagueName, forKey: "leagueName")
        league.setValue(leagueValue.leagueBadge, forKey: "leagueThump")
        league.setValue(leagueValue.leagueVideoLink, forKey: "leagueYoutube")
        league.setValue(leagueValue.leagueID, forKey: "leagueID")
        return league
    }
    
}
