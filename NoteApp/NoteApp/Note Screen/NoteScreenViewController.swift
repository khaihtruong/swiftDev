//
//  NoteScreenViewController.swift
//  NoteApp
//
//  Created by Khai Truong on 11/4/24.
//

import UIKit
import Alamofire

class NoteScreenViewController: UIViewController{

    let notificationCenter = NotificationCenter.default
    let noteScreen  = NoteScreenView()
    var noteNames = [String]()
    var noteArr = [Note]()
    var tokenData = ""
    
    override func loadView() {
        view = noteScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "All notes"
        // Do any additional setup after loading the view.
        //MARK: setting the delegate and data source...
        noteScreen.tableViewNotes.dataSource = self
        noteScreen.tableViewNotes.delegate = self
        //MARK: removing the separator line...
        noteScreen.tableViewNotes.separatorStyle = .none
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Profile", style:.plain, target: self,
            action: #selector(onButtonProfile)
        )
        
        getAllNotes(token: tokenData)
        
        noteScreen.buttonAdd.addTarget(self, action: #selector(onButtonAdd), for: .touchUpInside)
        
        notificationCenter.addObserver(
            self,
            selector: #selector(notification(notification:)),
            name: Notification.Name("add new note"),
            object: nil)
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    @objc func notification(notification: Notification){
        self.getAllNotes(token: tokenData)
    }
    
    @objc func onButtonAdd(){
        let addNoteScreen = AddNoteScreenViewController()
        addNoteScreen.delegateToken(token: tokenData)
        self.navigationController?.pushViewController(addNoteScreen, animated: true)
    }
    
    @objc func onButtonProfile(){
        getDetails(token: tokenData)
    }
    
    func delegateToken(token: String) {
        self.tokenData = token
    }

    //MARK: get all contacts call: getall endpoint...
    func getDetails(token: String){
        if let url = URL(string: APIConfigs.baseURL + "me"){
            AF.request(url, method: .get,
                       headers: [
                        "x-access-token": token
                       ]).responseData(completionHandler: { response in
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
                            
                                self.noteNames.removeAll()
                            
                                let decoder = JSONDecoder()
                                do{
                                    let receivedData =
                                        try decoder
                                        .decode(DetailInfo.self, from: data)
                                    print(receivedData)
                                    var detailScreen = DetailScreenViewController()
                                    detailScreen.delegateDetail(detail: receivedData)
                                    self.navigationController?.pushViewController(detailScreen, animated: true)
                                }catch{
                                    print("JSON couldn't be decoded.")
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
        }
    }
    
    //MARK: get all contacts call: getall endpoint...
    func getAllNotes(token: String){
        if let url = URL(string: APIConfigs.noteURL + "getall"){
            AF.request(url, method: .get,
                       headers: [
                        "x-access-token": token
                       ]).responseData(completionHandler: { response in
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
                            
                                self.noteNames.removeAll()
                            self.noteArr.removeAll()
                            
                                let decoder = JSONDecoder()
                                do{
                                    let receivedData =
                                        try decoder
                                        .decode(Notes.self, from: data)
                                    
                                    for item in receivedData.notes {
                                        
                                        self.noteNames.append(item.text)
                                        self.noteArr.append(item)
                                    }
                                    self.noteScreen.tableViewNotes.reloadData()
                                }catch{
                                    print("JSON couldn't be decoded.")
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
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func deleteSelectedFor(token: String){
        let saveAlert = UIAlertController(title: "Delete Note", message: "Are you sure you want to delete the note?", preferredStyle: UIAlertController.Style.alert)

        saveAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.deleteNote(token: token)
        }))
        saveAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
        }))

        self.present(saveAlert, animated: true, completion: nil)
    }

    func deleteNote(token: String){
        if let url = URL(string: APIConfigs.noteURL+"delete"){
            
            AF.request(url, method:.post, parameters:
                        [
                            //MARK: we can unwrap them here since we made sure they are not null above...
                            "id": token,
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
                                self.getAllNotes(token: self.tokenData)
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

extension NoteScreenViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notes", for: indexPath) as! NoteScreenTableViewCell
        cell.labelName.text = String(noteArr[indexPath.row].text.prefix(20))
        
        let buttonOptions = UIButton(type: .system)
        buttonOptions.sizeToFit()
        buttonOptions.showsMenuAsPrimaryAction = true
        //MARK: setting an icon from sf symbols...
        buttonOptions.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        
        //MARK: setting up menu for button options click...
        buttonOptions.menu = UIMenu(title: "Delete this note?",
                                    children: [
                                        UIAction(title: "Delete",handler: {(_) in
                                            self.deleteSelectedFor(token: self.noteArr[indexPath.row]._id)
                                        })
                                    ])
        cell.accessoryView = buttonOptions
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let noteView = NoteDetailScreenViewController()
        noteView.delegateDetail(detail: noteArr[indexPath.row].text)
        
        self.navigationController?.pushViewController(noteView, animated: true)
    }
}
