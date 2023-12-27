//
//  ViewController.swift
//  ContactsApp
//
//  Created by Yusuf Akbaş on 27.12.2023.
//

import UIKit

class HomePage: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var personTableView: UITableView!
    var personList = [Persons]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        personTableView.delegate = self
        personTableView.dataSource = self
        
        let k1 = Persons(person_id: 1, person_name: "Yusuf", person_number: "414141")
        let k2 = Persons(person_id: 2, person_name: "Ahmet", person_number: "343434")
        let k3 = Persons(person_id: 3, person_name: "Kayısı", person_number: "474747")
        personList.append(k1)
        personList.append(k2)
        personList.append(k3)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        print("Came back")
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

extension HomePage : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search for Person : \(searchText)")
    }
}

extension HomePage: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = personList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell") as! PersonCell
        
        cell.labelPersonName.text = person.person_name
        cell.labelPersonNumber.text = person.person_number
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = personList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: person)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            UIContextualAction,view,bool in
            let person = self.personList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete", message: "\(person.person_name!) delete ?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
                print("Delete Contact : \(person.person_name!)")
            }
            
            alert.addAction(yesAction)
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

