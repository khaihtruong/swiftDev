//
//  ViewController.swift
//  Calculator
//
//  Created by Khai Truong on 9/20/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstNum: UITextField!
    @IBOutlet var secondNum: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var subButton: UIButton!
    @IBOutlet var multiButton: UIButton!
    @IBOutlet var divButton: UIButton!
    @IBOutlet var result: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addButton.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)
        subButton.addTarget(self, action: #selector(subButtonClick), for: .touchUpInside)
        multiButton.addTarget(self, action: #selector(multiButtonClick), for: .touchUpInside)
        divButton.addTarget(self, action: #selector(divButtonClick), for: .touchUpInside)
    }
    @objc func onButtonClick() {
            
            if let n1 = firstNum.text, let intValue = Double(n1), let n2 = secondNum.text, let intValue2 = Double(n2) {
                result.text = String(intValue + intValue2)
            }
            else {
                emptyAlert()
            }
        }
        
        @objc func subButtonClick() {
            if let n1 = firstNum.text, let intValue = Double(n1), let n2 = secondNum.text, let intValue2 = Double(n2) {
                result.text = String(intValue - intValue2)
            }
            else {
                emptyAlert()
            }
        }
        
        @objc func multiButtonClick() {
            if let n1 = firstNum.text, let intValue = Double(n1), let n2 = secondNum.text, let intValue2 = Double(n2) {
                result.text = String(intValue * intValue2)
            }
            else {
                emptyAlert()
            }
        }
        
        @objc func divButtonClick() {
            
            if let n1 = firstNum.text, let intValue = Double(n1), let n2 = secondNum.text, let intValue2 = Double(n2) {
                if (intValue2 == 0) {
                    showErrorAlert()
                }
                else {
                    result.text = String(intValue / intValue2)
                }
            }
            else {
                emptyAlert()
            }
        }
        
        func showErrorAlert(){
            let alert = UIAlertController(
                title: "Error!", message: "Can't not divide a number by 0",
                preferredStyle: .alert
            )
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            self.present(alert, animated: true)
        }
        
        func emptyAlert() {
            let alert = UIAlertController(
                title: "Error!", message: "Error! The numbers cannot be empty!",
                preferredStyle: .alert
            )
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            self.present(alert, animated: true)
        }

}

