//
//  DetailScreenController.swift
//  ContactAPI
//
//  Created by Khai Truong on 10/21/24.
//

import UIKit
import Alamofire

class DetailScreenController: UIViewController {

    
    let detailView = DetailScreenView()
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .edit, target: self,
            action: #selector(onEditButtonTapped)
        )
        
        detailView.delete.addTarget(self, action: #selector(onButtonSubmitTapped), for: .touchUpInside)
        
        notificationCenter.addObserver(
            self,
            selector: #selector(notification(notification:)),
            name: Notification.Name("reloadDataDetail"),
            object: nil)
    }
    
    @objc func notification(notification: Notification){
        let contactInfo = (notification.object as! ContactDetail)
        detailView.name.text = contactInfo.name
        detailView.email.text = contactInfo.email
        detailView.phone.text = contactInfo.phone
    }
    
    @objc func onEditButtonTapped(){
        if let name = detailView.name.text,
           let email = detailView.email.text,
           let phoneText = detailView.phone.text{

            let contact = ContactDetail(name: name, phone: phoneText, email: email)
            let editScreen = EditScreenViewController()
            editScreen.delegateOnEdit(contactDetail: contact)
            self.navigationController?.pushViewController(editScreen, animated: true)
        }
    }
    
    @objc func onButtonSubmitTapped(){
        let deleteAlert = UIAlertController(title: "Delete Contact", message: "Contact will be deleted", preferredStyle: UIAlertController.Style.alert)

        deleteAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.deleteContact(name: self.detailView.name.text!)
        }))

        deleteAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
        }))

        self.present(deleteAlert, animated: true, completion: nil)
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
                                self.notificationCenter.post(
                                        name: Notification.Name("textFromSecondScreen"),
                                        object: "deleted")
                                    self.navigationController?.popViewController(animated: true)
                                    //self.navigationController?.pushViewController(firstScreenController, animated: true)
                                
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
    
    
    func delegateOnDetail(contactDetail: ContactDetail) {
        if let unwrappedName = contactDetail.name, let unwrappedEmail = contactDetail.email, let unwrappedPhone = contactDetail.phone {
            if !unwrappedName.isEmpty, !unwrappedEmail.isEmpty, !unwrappedPhone.isEmpty {
                detailView.name.text = "\(unwrappedName)"
                detailView.email.text = "Email: \(unwrappedEmail)"
                detailView.phone.text = "Phone: \(unwrappedPhone)"
            }
        }
    }

}
