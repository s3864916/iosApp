//
//  ViewController.swift
//  StoryBoardPractice
//
//  Created by 紀詠恩 on 2020/12/14.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var last: UITextField!
    @IBOutlet weak var first: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        first.becomeFirstResponder()
        first.delegate = self
        last.delegate = self
    }
    
    
    @IBAction func pressed(_ sender: Any) {
        nameLabel.text = "Hello Mr.\(first.text!) \(last.text!)"
        first.resignFirstResponder()
        last.resignFirstResponder()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pressed(Any.self)
        return false
    }
}

