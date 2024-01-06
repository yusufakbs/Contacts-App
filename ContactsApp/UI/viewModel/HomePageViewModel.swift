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
    
}
