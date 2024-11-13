//
//  ViewController.swift
//  ContactAPI
//
//  Created by Khai Truong on 10/21/24.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let mainScreen = MainScreenView()
    let notificationCenter = NotificationCenter.default
    
    //MARK: list to display the contact names in the TableView...
    var contactNames = [String]()
    
    override func loadView() {
        view = mainScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contacts JSON API"
        
        //MARK: setting the delegate and data source...
        mainScreen.tableViewContacts.dataSource = self
        mainScreen.tableViewContacts.delegate = self
        //MARK: removing the separator line...
        mainScreen.tableViewContacts.separatorStyle = .none
        
        //get all contact names when the main screen loads...
        getAllContacts()
        
        //MARK: add action to Add Contact button...
        mainScreen.buttonAdd.addTarget(self, action: #selector(onButtonAddTapped), for: .touchUpInside)
        
        notificationCenter.addObserver(
            self,
            selector: #selector(notification(notification:)),
            name: Notification.Name("textFromSecondScreen"),
            object: nil)
        
    }
    @objc func notification(notification: Notification){
        self.getAllContacts()
    }
    
    @objc func onButtonAddTapped(){
        //do the validations...
        if let name = mainScreen.textFieldAddName.text,
           let email = mainScreen.textFieldAddEmail.text,
           let phoneText = mainScreen.textFieldAddPhone.text{
            if !isValidEmail(email) {
                invalidEmail()
            }
            else if name.isEmpty || email.isEmpty || phoneText.isEmpty {
                emptyAlert()
            }
            
            else {
                if let phone = Int(phoneText) {
                    //The String 'phoneText' is successfully converted to an Int...
                    let contact = Contact(name: name, email: email, phone: phone)
                    
                    //MARK: call add a new contact API endpoint...
                    addANewContact(contact: contact)
                }else{
                    invalidPhone()
                }
            }
            
        }
        else{
            emptyAlert()
        }
    }
    
    func clearAddViewFields(){
        mainScreen.textFieldAddName.text = ""
        mainScreen.textFieldAddEmail.text = ""
        mainScreen.textFieldAddPhone.text = ""
    }
    
    func invalidEmail() {
        let alert = UIAlertController (
            title: "Invalid email!", message: "Please enter a valid email!",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func invalidPhone() {
        let alert = UIAlertController (
            title: "Invalid phone number!", message: "Phone number is digit only!",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func emptyAlert() {
        let alert = UIAlertController(
            title: "Error!", message: "Error! Enter all your informations!",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func detailsToContact(data: String){
        let parts = data.components(separatedBy: ",")
        
        //MARK: trim the whitespaces from the strings, and show alert...
        let name = parts[0].trimmingCharacters(in: .whitespacesAndNewlines)
        let email = parts[1].trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = parts[2].trimmingCharacters(in: .whitespacesAndNewlines)

        if !name.isEmpty, !email.isEmpty, !phone.isEmpty {
            let contactDetail = ContactDetail(name: name, phone: phone, email: email)
            let detailView = DetailScreenController()
            detailView.delegateOnDetail(contactDetail: contactDetail)
            navigationController?.pushViewController(detailView, animated: true)
        }
    }
    
    //MARK: add a new contact call: add endpoint...
    func addANewContact(contact: Contact){
        if let url = URL(string: APIConfigs.baseURL+"add"){
            
            AF.request(url, method:.post, parameters:
                        [
                            "name": contact.name,
                            "email": contact.email,
                            "phone": contact.phone
                        ])
                .responseString(completionHandler: { response in
                    //MARK: retrieving the status code...
                    let status = response.response?.statusCode
                    
                    switch response.result{
                    case .success(let data):
                        //MARK: there was no network error...
                        
                        //MARK: status code is Optional, so unwrapping it...
                        if let uwStatusCode = status{
                            switch uwStatusCode{
                                case 200...299:
                                    //MARK: the request was valid 200-level...
                                    self.getAllContacts()
                                    self.clearAddViewFields()
                                    break
                        
                                case 400...499:
                                //MARK: the request was not valid 400-level...
                                    print(data)
                                    break
                        
                                default:
                                //MARK: probably a 500-level error...
                                    print(data)
                                    break
                        
                            }
                        }
                        break
                        
                    case .failure(let error):
                        //MARK: there was a network error...
                        print(error)
                        break
                    }
                })
        }else{
            //alert that the URL is invalid...
        }
    }
    
    //MARK: get all contacts call: getall endpoint...
    func getAllContacts(){
        if let url = URL(string: APIConfigs.baseURL + "getall"){
            AF.request(url, method: .get).responseString(completionHandler: { response in
                //MARK: retrieving the status code...
                let status = response.response?.statusCode
                
                switch response.result{
                case .success(let data):
                    //MARK: there was no network error...
                    
                    //MARK: status code is Optional, so unwrapping it...
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                            case 200...299:
                            //MARK: the request was valid 200-level...
                                let names = data.components(separatedBy: "\n")
                                self.contactNames = names
                                self.contactNames.removeLast()
                                self.mainScreen.tableViewContacts.reloadData()
                                break
                    
                            case 400...499:
                            //MARK: the request was not valid 400-level...
                                print(data)
                                break
                    
                            default:
                            //MARK: probably a 500-level error...
                                print(data)
                                break
                    
                        }
                    }
                    break
                    
                case .failure(let error):
                    //MARK: there was a network error...
                    print(error)
                    break
                }
            })
        }
    }
    
    //MARK: get details of a contact...
    func getContactDetails(name: String){
        if let url = URL(string: APIConfigs.baseURL+"details"){
            AF.request(url, method:.get,
                       parameters: ["name":name],
                       encoding: URLEncoding.queryString)
                .responseString(completionHandler: { response in
                
                //MARK: retrieving the status code...
                let status = response.response?.statusCode
                
                switch response.result{
                case .success(let data):
                    //MARK: there was no network error...
                    
                    //MARK: status code is Optional, so unwrapping it...
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                            case 200...299:
                            //MARK: the request was valid 200-level...
                                //MARK: show alert with details...
                                self.detailsToContact(data: data)
                                break
                    
                            case 400...499:
                            //MARK: the request was not valid 400-level...
                                print(data)
                                break
                    
                            default:
                            //MARK: probably a 500-level error...
                                print(data)
                                break
                    
                        }
                    }
                    break
                    
                case .failure(let error):
                    //MARK: there was a network error...
                    print(error)
                    break
                }
            })
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "names", for: indexPath) as! ContactsTableViewCell
        cell.labelName.text = contactNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        getContactDetails(name: self.contactNames[indexPath.row])
    }
}

