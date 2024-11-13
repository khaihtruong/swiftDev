//
//  DetailScreenViewController.swift
//  NoteApp
//
//  Created by Khai Truong on 11/4/24.
//

import UIKit
import Alamofire

class DetailScreenViewController: UIViewController {
    
    let detailView = DetailScreenView()
    let notificationCenter = NotificationCenter.default

    override func loadView() {
        view = detailView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "User Info"
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Log Out", style:.plain, target: self,
            action: #selector(onButtonLogOut)
        )
    }

    func delegateDetail(detail: DetailInfo) {
        if !detail.email.isEmpty, !detail.email.isEmpty {
            detailView.name.text = "Name: \(detail.name)"
            detailView.email.text = "Email: \(detail.email)"
        }
    }
    
    @objc func onButtonLogOut() {
        logOut()
        
    }
    
    func logOut(){
        if let url = URL(string: APIConfigs.baseURL + "logout"){
            AF.request(url, method: .get).responseData(completionHandler: { response in
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
                            
                            let alert = UIAlertController(title: "Log Out!", message: "Are you sure you want to log out?", preferredStyle: UIAlertController.Style.alert)

                            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
                            }))
                            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                                let logInScreen = ViewController()
                                let defaults = UserDefaults.standard
                                defaults.set(nil, forKey: "apiKey")
                                self.notificationCenter.post(
                                        name: Notification.Name("log out"),
                                        object: nil)
                                self.navigationController?.pushViewController(logInScreen, animated: true)
                            }))
                            
                            self.present(alert, animated: true, completion: nil)
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
