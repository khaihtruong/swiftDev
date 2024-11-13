//
//  AddNoteScreenViewController.swift
//  NoteApp
//
//  Created by Khai Truong on 11/4/24.
//

import UIKit
import Alamofire

class AddNoteScreenViewController: UIViewController {

    var tokenData = ""
    let addNoteScreen = AddNoteScreenView()
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = addNoteScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Add New Note"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save, target: self,
            action: #selector(onSaveButtonTapped)
        )
    }
    
    @objc func onSaveButtonTapped() {
        if let uwnote = addNoteScreen.text.text {
            if uwnote.isEmpty {
                let alert = UIAlertController(title: "Empty Note", message: "Please fill in your note!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                }))
                self.present(alert, animated: true, completion: nil)
            } else {
                addNewNote(note: uwnote)
            }
            
        }
    }
    
    func delegateToken(token: String) {
        self.tokenData = token
    }
    
    func addNewNote(note: String){
        if let url = URL(string: APIConfigs.noteURL+"post"){
            
            AF.request(url, method:.post, parameters:
                        [
                            //MARK: we can unwrap them here since we made sure they are not null above...
                            "text": note,
                        ], headers: [
                            "x-access-token": self.tokenData
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
                                        name: Notification.Name("add new note"),
                                        object: "new note added")
                                self.navigationController?.popViewController(animated: true)
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

}
