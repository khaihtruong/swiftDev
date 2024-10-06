//
//  AddContactViewController.swift
//  ContactApp
//
//  Created by Khai Truong on 10/3/24.
//

import UIKit

class AddContactViewController: UIViewController {

    var delegate: ViewController!
    
    let types: [String] = ["Cell", "Work", "Home"]
    var selected = "Cell"
    
    let addContactScreen = AddContactView()
    
    
    override func loadView() {
        view = addContactScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addContactScreen.option.delegate = self
        addContactScreen.option.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Save", style: .plain, target: self,
            action: #selector(onAddBarButtonTapped)
        )
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
            tapRecognizer.cancelsTouchesInView = false
            view.addGestureRecognizer(tapRecognizer)
        
    }
    
    @objc func onAddBarButtonTapped(){
        let name = addContactScreen.name.text
        let city = addContactScreen.city.text
        let address = addContactScreen.address.text
        let email = addContactScreen.email.text
        let phone = addContactScreen.phone.text
        let zip = addContactScreen.zip.text
        
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
                let newContact = Contact(name: unwrappedName, phone: unwrappedPhone, email: unwrappedEmail, type: selected, address: unwrappedAddress, city: unwrappedCity, zip: unwrappedZip)
                delegate.delegateOnAddContact(contact: newContact)
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension AddContactViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //MARK: we are using only one section...
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //MARK: we are displaying the options from Utilities.types...
        return types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        //MARK: updating the selected type when the user picks this row...
        selected = types[row]
        return types[row]
    }
}

