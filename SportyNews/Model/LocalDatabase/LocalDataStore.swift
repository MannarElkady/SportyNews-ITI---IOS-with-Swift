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
class CoreDataHandler {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var managedContext:NSManagedObjectContext?
    private static var instance = CoreDataHandler()
    
    private init () {
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    static func getCoreHandlerInstance() -> CoreDataHandler {
        return instance
    }
    
    
    func insertInLocalLeagues(league LeagueValue:LeagueEntity)  -> LeagueEntity {
        let entity = NSEntityDescription.entity(forEntityName: "FavouriteLeague", in: managedContext!)
        var leagueNSManagedObject = NSManagedObject(entity: entity!, insertInto: managedContext!)
        
        leagueNSManagedObject = prepareNSManagedObject(leagueValue: LeagueValue, leagueNSManagedObject: leagueNSManagedObject)
        
        do{
            try managedContext!.save()
        }
        catch{
            print("error in insertInLocalLeagues")
        }
        return LeagueValue
    }
    
    
    func getFavouriteLeagues() -> [LeagueEntity] {
        return fetchData()
    }
    
    
    
    private func fetchData() -> [LeagueEntity]{
        
        var leagues = [LeagueEntity]()
        var leaguesNSManagedOBjects = Array<NSManagedObject>()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavouriteLeague")
        
        do{
            leaguesNSManagedOBjects = try managedContext!.fetch(fetchRequest)
            
            leaguesNSManagedOBjects.forEach({(object) in
                leagues.append(prepareLeagueObject(leagueNSManagedObject: object))
            })
        }
        catch{
            print("error in fetchData")
        }
        return leagues
    }
    
    private func prepareNSManagedObject(leagueValue:LeagueEntity,leagueNSManagedObject : NSManagedObject) -> NSManagedObject{
        
        leagueNSManagedObject.setValue(leagueValue.leagueID, forKey: "leagueID")
        leagueNSManagedObject.setValue(leagueValue.leagueName, forKey: "leagueName")
        leagueNSManagedObject.setValue(leagueValue.leagueBadge, forKey: "leagueThump")
        leagueNSManagedObject.setValue(leagueValue.leagueVideoLink, forKey: "leagueYoutube")
        
        return leagueNSManagedObject
    }
    
    private func prepareLeagueObject(leagueNSManagedObject : NSManagedObject) -> LeagueEntity{
        
        let league = LeagueEntity()
        league.leagueID = leagueNSManagedObject.value(forKey: "leagueID") as? String
        league.leagueName = leagueNSManagedObject.value(forKey: "leagueName") as? String
        league.leagueBadge = leagueNSManagedObject.value(forKey: "leagueThump") as? String
        league.leagueVideoLink = leagueNSManagedObject.value(forKey: "leagueYoutube") as? String

        return league
    }
    
    
    func deleteFromEntity(id : String){
        
        let leagueNSManagedObject = fetchLeagueById(id: id)
        
        if(leagueNSManagedObject == nil){
            return
        }
        managedContext?.delete(leagueNSManagedObject!)
        
        do{
            try managedContext!.save()
        }
        catch{
            print("error in deleteFromEntity")
        }
    }
    
    func fetchLeagueById(id :String) -> NSManagedObject?{
        var leaguesNSManagedOBjects = Array<NSManagedObject>()
        
        let predicate = NSPredicate(format: "leagueID == %@",id)
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavouriteLeague")
        
        fetchRequest.predicate = predicate
        
        do{
            leaguesNSManagedOBjects = try managedContext!.fetch(fetchRequest)
        }
        catch{
            print("error in fetchData")
        }
        if(leaguesNSManagedOBjects.count > 0 ){
            return leaguesNSManagedOBjects[0]
        }
        return  nil
    }
    
}
