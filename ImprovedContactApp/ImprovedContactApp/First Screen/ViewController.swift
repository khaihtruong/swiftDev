//
//  ViewController.swift
//  ContactApp
//
//  Created by Khai Truong on 10/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    var delegate: DetailViewController!

    //MARK: expenses array to populate TableView...
    var contacts = [Contact]()
    
    //MARK: predefined types of expenses...
    let types = ["Cell", "Home", "Work"]
    
    let firstScreen = FirstScreenView()
    
    override func loadView() {
        view = firstScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        firstScreen.tableView.delegate = self
        firstScreen.tableView.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
    }
    @objc func onAddBarButtonTapped(){
        let addContactController = AddContactViewController()
        addContactController.delegate = self
        navigationController?.pushViewController(addContactController, animated: true)
    }
    
    func delegateOnAddContact(contact: Contact){
        contacts.append(contact)
        firstScreen.tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    //MARK: returns the number of rows in the current section...
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    //MARK: populate a cell for the current row...
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contacts", for: indexPath) as! FirstScreenContactCell
        
        if let uwName = contacts[indexPath.row].name{
            cell.name.text = "\(uwName)"
        }
        
        
        if let uwEmail = contacts[indexPath.row].email{
            cell.email.text = "\(uwEmail)"
        }
        
        
        if let uwPhone = contacts[indexPath.row].phone, let uwType = contacts[indexPath.row].type {
            cell.phone.text = "\(uwPhone) (\(uwType))"
        }
        
        if let uwImage = contacts[indexPath.row].image{
            cell.imageReceipt.image = uwImage
        }
        
        return cell
    }
    
    //MARK: deal with user interaction with a cell...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = DetailViewController()
        detailView.delegateOnDetail(contact: contacts[indexPath.row])
        navigationController?.pushViewController(detailView, animated: true)
    }
    
    
}
