//
//  ViewController.swift
//  App4
//
//  Created by Sakib Miazi on 5/16/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: initializing the First Screen View...
    
    // ***********
    let firstScreen = FirstScreenView()
    
    let types: [String] = ["Cell", "Work", "Home"]
    var selectedTypes = "Cell"
    
    public struct Package {
        var address:String?
        var name:String?
        var phone: String?
        var email: String?
        var zip: String?
        var city: String?
        var types: String?
        
        init(address: String? = nil, name: String? = nil, phone: String? = nil, email: String? = nil, zip: String? = nil, city: String? = nil, types: String? = nil) {
            self.address = address
            self.name = name
            self.phone = phone
            self.email = email
            self.zip = zip
            self.city = city
            self.types = types
        }
    }
    
    //MARK: add the view to this controller while the view is loading...
    override func loadView() {
        view = firstScreen
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        super.title = "Create Profile"
        
        //MARK: adding the PickerView delegate and data source...
        firstScreen.option.delegate = self
        firstScreen.option.dataSource = self
        
        //MARK: adding action for firstScreen.
        firstScreen.button.addTarget(self, action: #selector(onButtonSubmitTapped), for: .touchUpInside)
        
    }
    
    
    
    //MARK: submit button tapped action...
    @objc func onButtonSubmitTapped(){
        let name = firstScreen.name.text
        let city = firstScreen.city.text
        let address = firstScreen.address.text
        let email = firstScreen.email.text
        let phone = firstScreen.num.text
        let zip = firstScreen.zip.text
        
        if let unwrappedName = name, let unwrappedCity = city, let unwrappedAddress = address, let  unwrappedEmail = email, let unwrappedPhone = phone, let unwrappedZip = zip {
            if unwrappedName.isEmpty || unwrappedCity.isEmpty || unwrappedAddress.isEmpty {
                emptyAlert()
            } else if !isValidEmail(unwrappedEmail) {
                invalidEmail()
            } else if unwrappedPhone.count != 10{
                invalidPhone()
            } else if unwrappedZip.count != 5 {
                invalidZip()
            } else {
                let package = Package(address: unwrappedAddress, name: unwrappedName, phone: unwrappedPhone, email: unwrappedEmail, zip: unwrappedZip, city: unwrappedCity, types: selectedTypes)
                
                let displaySecond = DisplayViewController()
                displaySecond.receivedPackage = package
                
                navigationController?.pushViewController(displaySecond, animated: true)
            }
        }
    }
    
    func emptyAlert() {
        let alert = UIAlertController(
            title: "Error!", message: "Error! Enter all your informations!",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func invalidZip() {
        let alert = UIAlertController (
            title: "Invalid zip code!", message: "Zip code must be 5 digits!",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func invalidEmail() {
        let alert = UIAlertController (
            title: "Invalid email!", message: "Please enter a valid email!",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func invalidPhone() {
        let alert = UIAlertController (
            title: "Invalid phone number!", message: "Please enter a valid phone number!",
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

}


//MARK: implementing mood PickerView...
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    //returns the number of columns/components in the Picker View...
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //returns the number of rows in the current component...
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
    
    //set the title of currently picked row...
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // on change selection, update selectedMood...
        selectedTypes = types[row]
        return types[row]
    }
    
    
}
