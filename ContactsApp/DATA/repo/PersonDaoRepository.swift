//
//  PersonDaoRepository.swift
//  ContactsApp
//
//  Created by Yusuf Akbaş on 6.01.2024.
//

import Foundation
import RxSwift

class PersonDaoRepository {
    var personList = BehaviorSubject<[Persons]>(value: [Persons]())
    
    let db:FMDatabase?
    
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dataBaseURL = URL(fileURLWithPath: targetPath).appendingPathComponent("directory.sqlite")
        db = FMDatabase(path: dataBaseURL.path())
    }
    
    func save(person_name:String, person_number:String){
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO persons (person_name,person_num) VALUES (?,?)", values: [person_name,person_number])
            
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func update(person_id:Int, person_name:String , person_number:String){
        db?.open()
        do{
            try db!.executeUpdate("UPDATE persons SET person_name = ?, person_num = ? WHERE person_id = ?", values: [person_name, person_number, person_id])
            
        }catch {
            print(error.localizedDescription)
        }
        db?.close()   
    }
    
    
    func delete(person_id:Int) {
        db?.open()
        do{
            try db!.executeUpdate("DELETE FROM persons WHERE person_id = ?", values: [person_id])
            personLoad()
        }catch {
            print(error.localizedDescription)
        }
        db?.close()

    }
    
    func search(searchText : String) {
        db?.open()
        var list = [Persons]()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM persons WHERE person_name like '%\(searchText)%'", values: nil)
            while rs.next() {
                let person = Persons(person_id: Int(rs.string(forColumn: "person_id"))!, person_name: rs.string(forColumn: "person_name")!, person_number: rs.string(forColumn: "person_num")!)
                list.append(person)
            }
            personList.onNext(list)
        }catch {
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }

    
    func personLoad(){
        db?.open()
        var list = [Persons]()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM persons", values: nil)
            while rs.next() {
                let person = Persons(person_id: Int(rs.string(forColumn: "person_id"))!, person_name: rs.string(forColumn: "person_name")!, person_number: rs.string(forColumn: "person_num")!)
                list.append(person)

            }
            personList.onNext(list)
        }catch {
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
}

