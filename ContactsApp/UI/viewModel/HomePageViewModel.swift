//
//  HomePageViewModel.swift
//  ContactsApp
//
//  Created by Yusuf Akbaş on 6.01.2024.
//

import Foundation
import RxSwift

class HomePageViewModel {
    
    var pRepo = PersonDaoRepository()
    var personList = BehaviorSubject<[Persons]>(value: [Persons]())
    
    init(){
        databaseCopy()
        personList = pRepo.personList
        personLoad()
    }
    
    func delete(person_id:Int) {
        pRepo.delete(person_id: person_id)
    }
    
    func search(searchText:String){
        pRepo.search(searchText: searchText)
    }
    
    func personLoad(){
        pRepo.personLoad()
    }
    
    func databaseCopy(){
        let bundlePath = Bundle.main.path(forResource: "directory", ofType: ".sqlite")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let placeToCopy = URL(fileURLWithPath: targetPath).appendingPathComponent("directory.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: placeToCopy.path){
            print("Database already exist!")
        }else {
            do{
                try fileManager.copyItem(atPath: bundlePath!, toPath: placeToCopy.path)
            }catch {}
        }
    }
    
}
