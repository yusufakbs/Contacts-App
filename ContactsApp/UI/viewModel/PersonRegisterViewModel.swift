//
//  PersonRegisterViewModel.swift
//  ContactsApp
//
//  Created by Yusuf Akbaş on 6.01.2024.
//

import Foundation

class PersonRegisterViewModel {
    
    var pRepo = PersonDaoRepository()
    
    func save(person_name:String, person_number:String){
        pRepo.save(person_name: person_name, person_number: person_number)
    }
}
