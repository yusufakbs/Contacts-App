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
    
    func save(person_name:String, person_number:String){
        print("Save Contact: \(person_name) - \(person_number)")
    }
    
    func update(person_id:Int, person_name:String , person_number:String){
        print("Person update : \(person_id) - \(person_name) - \(person_number)")
    }
    
    
    func delete(person_id:Int) {
        print("Delete Contact : \(person_id)")
        personLoad()
    }
    
    func search(searchText : String) {
        print("Person search : \(searchText)")
    }
    
    func personLoad(){
        var list = [Persons]()
        let k1 = Persons(person_id: 1, person_name: "Yusuf", person_number: "414141")
        let k2 = Persons(person_id: 2, person_name: "Ahmet", person_number: "343434")
        let k3 = Persons(person_id: 3, person_name: "Kayısı", person_number: "474747")
        list.append(k1)
        list.append(k2)
        list.append(k3)
        personList.onNext(list)
    }
}

