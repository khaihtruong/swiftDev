//
//  ViewController.swift
//  NoteApp
//
//  Created by Khai Truong on 11/3/24.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    let mainScreen = MainScreenView()
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = mainScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Note App"
        
        mainScreen.login.addTarget(self, action: #selector(onButtonLogin), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Register", style:.plain, target: self,
            action: #selector(onButtonRegister)
        )
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        notificationCenter.addObserver(
            self,
            selector: #selector(notification(notification:)),
            name: Notification.Name("log out"),
            object: nil)
        
        let apiKeySaved = UserDefaults.standard.object(forKey: "apiKey") as! String?
                
        if let apiKey = apiKeySaved{
            if !apiKey.isEmpty {
                //MARK: tasks if there is a key saved
                print("The Saved API Key: \(apiKey)")
                let noteScreen = NoteScreenViewController()
                noteScreen.delegateToken(token: apiKey)
                self.navigationController?.pushViewController(noteScreen, animated: true)
            }
        }else{
        }
        
    }
    
    @objc func notification(notification: Notification){
        let defaults = UserDefaults.standard
        defaults.set(nil, forKey: "apiKey")
    }
    
    @objc func onButtonLogin(){
        
        if let email = mainScreen.email.text,
           let pw = mainScreen.pw.text {
            let loginInfo = LoginInfo(email: email, password: pw)
            loginUser(loginInfo: loginInfo)
            
        }
        else {
            print("error")
        }
    }
    
    @objc func onButtonRegister(){
        let registerScreen = RegisterScreenViewController()
        navigationController?.pushViewController(registerScreen, animated: true)
    }
    
    //MARK: add a new contact call: add endpoint...
    func loginUser(loginInfo: LoginInfo){
        if let url = URL(string: APIConfigs.baseURL+"login"){
            
            AF.request(url, method:.post, parameters:
                        [
                            //MARK: we can unwrap them here since we made sure they are not null above...
                            "email": loginInfo.email,
                            "password": loginInfo.password
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
                                let convertedData = data.data(using:.utf8)!
                                do {
                                    let jsonDecoder = JSONDecoder()
                                    let decodedResponse = try jsonDecoder.decode(Token.self, from: convertedData)
                                    let noteScreen = NoteScreenViewController()
                                    noteScreen.delegateToken(token: decodedResponse.token)
                                    let valueToBeSaved = decodedResponse.token
                                    let defaults = UserDefaults.standard
                                    defaults.set(valueToBeSaved, forKey: "apiKey")
                                    self.navigationController?.pushViewController(noteScreen, animated: true)
                                } catch {
                                    print(error)
                                }
                                
                        
                                case 400...499:
                                //MARK: the request was not valid 400-level...
                                let alert = UIAlertController(title: "User not found!", message: "Your email or password is incorrect.", preferredStyle: UIAlertController.Style.alert)

                                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                                }))

                                self.present(alert, animated: true, completion: nil)
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
            print(APIConfigs.baseURL+"login")
            print("url is invalid")
        }
    }

    
}

