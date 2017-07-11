//
//  ViewController.swift
//  text_parser
//
//  Created by Tian Qiu on 7/8/17.
//  Copyright © 2017 Tian Qiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var Character_field: UITextField!
    @IBOutlet weak var Pinyin_field: UITextField!
    @IBOutlet weak var Eng_def_field: UITextField!
    var Charset_num=0
    var myStrings2: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let path = Bundle.main.path(forResource: "vocab", ofType: "txt"){
            do{
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .whitespacesAndNewlines)  //myStrings contain the whole txt parced into array
                Character_field.text=myStrings[Charset_num]
                Pinyin_field.text=myStrings[Charset_num+1]
                Eng_def_field.text=myStrings[Charset_num+2]
                myStrings2=myStrings
            }
            catch{
                print("error")
            }
            
        }
    }
    
   
    
    @IBAction func Button1_pressed(_ sender: Any) {
        if Charset_num<19*3{
            Charset_num += 3
            Character_field.text=myStrings2[Charset_num]
            Pinyin_field.text=myStrings2[Charset_num+1]
            Eng_def_field.text=myStrings2[Charset_num+2]
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

