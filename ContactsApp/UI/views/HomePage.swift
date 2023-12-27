//
//  ViewController.swift
//  ContactsApp
//
//  Created by Yusuf Akbaş on 27.12.2023.
//

import UIKit

class HomePage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonDetail(_ sender: Any) {
        
        let person = Persons(person_id: 1, person_name: "John", person_number: "11111")
        performSegue(withIdentifier: "toDetail", sender: person)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let person = sender as? Persons {
                let toGoVC = segue.destination as! PersonDetail
                toGoVC.person = person
            }
        }
    }
}

