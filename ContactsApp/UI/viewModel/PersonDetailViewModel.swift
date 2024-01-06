//
//  PersonDetailViewModel.swift
//  ContactsApp
//
//  Created by Yusuf Akbaş on 6.01.2024.
//

import Foundation

class PersonDetailViewModel {
    var pRepo = PersonDaoRepository()
    
    func update(person_id:Int, person_name:String , person_number:String){
        pRepo.update(person_id: person_id, person_name: person_name, person_number: person_number)
    }
    
}
