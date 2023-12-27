//
//  Persons.swift
//  ContactsApp
//
//  Created by Yusuf Akbaş on 27.12.2023.
//

import Foundation

class Persons {
    var person_id:Int?
    var person_name:String?
    var person_number:String?
    
    init(){
        
    }
    
    init(person_id: Int, person_name: String, person_number: String) {
        self.person_id = person_id
        self.person_name = person_name
        self.person_number = person_number
    }
    
}
