//
//  AddContactViewController.swift
//  ContactApp
//
//  Created by Khai Truong on 10/3/24.
//

import UIKit
import PhotosUI

class AddContactViewController: UIViewController {

    var delegate: ViewController!
    
    var selected = "Cell"
    
    var pickedImage:UIImage?
    
    let addContactScreen = AddContactView()
    
    
    override func loadView() {
        view = addContactScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Save", style: .plain, target: self,
            action: #selector(onAddBarButtonTapped)
        )
        
        addContactScreen.buttonSelectType.menu = getMenuTypes()
        
        addContactScreen.buttonTakePhoto.menu = getMenuImagePicker()

        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
            tapRecognizer.cancelsTouchesInView = false
            view.addGestureRecognizer(tapRecognizer)
        
    }
    func getMenuTypes() -> UIMenu{
        var menuItems = [UIAction]()
        
        for type in Utilities.types{
            let menuItem = UIAction(title: type,handler: {(_) in
                                self.selected = type
                                self.addContactScreen.buttonSelectType.setTitle(self.selected, for: .normal)
                            })
            menuItems.append(menuItem)
        }
        
        return UIMenu(title: "Select type", children: menuItems)
    }
    
    func getMenuImagePicker() -> UIMenu{
        var menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    //MARK: take Photo using Camera...
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    //MARK: pick Photo using Gallery...
    func pickPhotoFromGallery(){
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
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
            } else if unwrappedZip.count != 5 || Int(unwrappedZip)! < 00001 || Int(unwrappedZip)! > 99950 {
                invalidZip()
            } else {
                let newContact = Contact(name: unwrappedName, phone: unwrappedPhone, email: unwrappedEmail, type: selected, address: unwrappedAddress, city: unwrappedCity, zip: unwrappedZip, image: pickedImage ?? (UIImage(systemName: "photo"))!)
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
            title: "Invalid zip code!", message: "Zip code must be 5 digits range from 00001-99550!",
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


extension AddContactViewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.addContactScreen.buttonTakePhoto.setImage(
                                uwImage.withRenderingMode(.alwaysOriginal),
                                for: .normal
                            )
                            self.pickedImage = uwImage
                        }
                    }
                })
            }
        }
    }
}

extension AddContactViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.addContactScreen.buttonTakePhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
            // Do your thing for No image loaded...
        }
    }
}
