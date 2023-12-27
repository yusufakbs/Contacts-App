//
//  PersonRegistration.swift
//  ContactsApp
//
//  Created by Yusuf Akbaş on 27.12.2023.
//

import UIKit

class PersonRegistration: UIViewController {

    @IBOutlet weak var tfPersonName: UITextField!
    @IBOutlet weak var tfPersonNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        if let name = tfPersonName.text , let number = tfPersonNumber.text {
            save(person_name: name, person_number: number)
        }
    }
    
    func save(person_name:String, person_number:String){
        print("Save Contact: \(person_name) - \(person_number)")
    }
}
