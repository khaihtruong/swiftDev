//
//  RegisterScreenViewController.swift
//  NoteApp
//
//  Created by Khai Truong on 11/4/24.
//

import UIKit
import Alamofire

class RegisterScreenViewController: UIViewController {

    let registerScreen = RegisterScreenView()
    
    override func loadView() {
        view = registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Register"
        
        registerScreen.register.addTarget(self, action: #selector(onButtonRegister), for: .touchUpInside)
            
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
    
    @objc func onButtonRegister(){
        if let name = registerScreen.name.text,
           let email = registerScreen.email.text,
           let pw = registerScreen.pw.text {
            if isValidEmail(email) {
                let contact = Contact(name: name, email: email, password: pw)
                addANewContact(contact: contact)
            } else {
                invalidEmail()
            }
        }
    }
    
    func addANewContact(contact: Contact){
        if let url = URL(string: APIConfigs.baseURL+"register"){
            
            AF.request(url, method:.post, parameters:
                        [
                            //MARK: we can unwrap them here since we made sure they are not null above...
                            "name": contact.name,
                            "email": contact.email,
                            "password": contact.password
                        ])
            .responseString(completionHandler: { [self] response in
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
                                let successAlert = UIAlertController(title: "Success", message: "Your account is registered successfully!", preferredStyle: UIAlertController.Style.alert)

                                successAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                                    self.navigationController?.popViewController(animated: true)
                                }))
                                self.present(successAlert, animated: true, completion: nil)
                                    break
                        
                                case 400...499:
                                //MARK: the request was not valid 400-level...
                                    print(data)
                                    break
                        
                                default:
                                let alert = UIAlertController(title: "Problem registering the user", message: "There is already account with the same information", preferredStyle: UIAlertController.Style.alert)

                                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                                }))
                                self.present(alert, animated: true, completion: nil)
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
}
