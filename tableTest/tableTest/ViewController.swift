//
//  ViewController.swift
//  tableTest
//
//  Created by 紀詠恩 on 2020/12/25.
//

import UIKit

class ViewController: UIViewController {
    
    var text:String = ""
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = text
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textView.text = text

    }


}

