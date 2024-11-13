//
//  EditScreenViewController.swift
//  ContactAPI
//
//  Created by Khai Truong on 10/22/24.
//

import UIKit
import Alamofire

class EditScreenViewController: UIViewController {

    let editScreen = EditScreen()
    let notificationCenter = NotificationCenter.default
    var nameToDelete = "holder"
    
    override func loadView() {
        view = editScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save, target: self,
            action: #selector(onSaveButtonTapped)
        )
    }
    
    @objc func onSaveButtonTapped(){
        let saveAlert = UIAlertController(title: "Save Contact", message: "Are you sure you want to save your changes?", preferredStyle: UIAlertController.Style.alert)

        saveAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            if let name = self.editScreen.name.text,
               let email = self.editScreen.email.text,
               let phoneText = self.editScreen.phone.text{
                if !self.isValidEmail(email) {
                    self.invalidEmail()
                }
                else if name.isEmpty || email.isEmpty || phoneText.isEmpty {
                    self.emptyAlert()
                }
                
                else {
                    if let phone = Int(phoneText) {
                        //The String 'phoneText' is successfully converted to an Int...
                        self.deleteContact(name: self.nameToDelete)
                        self.navigationController?.popViewController(animated: true)
                        
                    }else{
                        self.invalidPhone()
                    }
                }
                
            }
            
        }))

        saveAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
        }))

        self.present(saveAlert, animated: true, completion: nil)
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
    
    func deleteContact(name: String){
        if let url = URL(string: APIConfigs.baseURL+"delete"){
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
                                    //let firstScreenController = ViewController()
                                
                                if let name = self.editScreen.name.text,
                                   let email = self.editScreen.email.text,
                                   let phoneText = self.editScreen.phone.text{
                                    
                                    if let phone = Int(phoneText){
                                        //The String 'phoneText' is successfully converted to an Int...
                                        let contact = Contact(name: name, email: email, phone: phone)
                                        
                                        //MARK: call add a new contact API endpoint...
                                        self.addANewContact(contact: contact)
                                    }
                                }
                                   
                                
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
                                self.notificationCenter.post(
                                        name: Notification.Name("textFromSecondScreen"),
                                        object: "deleted")
                                self.notificationCenter.post(
                                        name: Notification.Name("reloadDataDetail"),
                                        object: ContactDetail(name:contact.name, phone: String(contact.phone), email:contact.email))
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
    
    func delegateOnEdit(contactDetail: ContactDetail) {
        if let unwrappedName = contactDetail.name, let unwrappedEmail = contactDetail.email, let unwrappedPhone = contactDetail.phone {
            if !unwrappedName.isEmpty, !unwrappedEmail.isEmpty, !unwrappedPhone.isEmpty {
                nameToDelete = unwrappedName
                
                let emailParts = unwrappedEmail.components(separatedBy: " ")
                let email = emailParts[1].trimmingCharacters(in: .whitespacesAndNewlines)
                
                let phoneParts = unwrappedPhone.components(separatedBy: " ")
                let phone = phoneParts[1].trimmingCharacters(in: .whitespacesAndNewlines)
                
                editScreen.name.text = "\(unwrappedName)"
                editScreen.email.text = "\(email)"
                editScreen.phone.text = "\(phone)"
            }
        }
    }

}
