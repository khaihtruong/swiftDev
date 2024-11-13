//
//  NoteDetailScreenViewController.swift
//  NoteApp
//
//  Created by Khai Truong on 11/4/24.
//

import UIKit

class NoteDetailScreenViewController: UIViewController {

    let noteView = NoteDetailScreenView()
    
    override func loadView() {
        view = noteView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Note Detail"
        // Do any additional setup after loading the view.
    }
    
    func delegateDetail(detail: String) {
        if !detail.isEmpty {
            noteView.text.text = detail
        }
    }


}
