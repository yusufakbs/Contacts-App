//
//  PersonDetail.swift
//  ContactsApp
//
//  Created by Yusuf Akbaş on 27.12.2023.
//

import UIKit

class PersonDetail: UIViewController {

    @IBOutlet weak var tfPersonName: UITextField!
    @IBOutlet weak var tfPersonNumber: UITextField!
    
    var person:Persons?
    var viewModel = PersonDetailViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = person {
            tfPersonName.text = k.person_name
            tfPersonNumber.text = k.person_number
        }
    }
    
    @IBAction func buttonUpdate(_ sender: Any) {
        
        if let pn = tfPersonName.text , let pr = tfPersonNumber.text, let k = person{
            
            viewModel.update(person_id: k.person_id!, person_name: pn, person_number: pr)
    
        }
    }
    
}
