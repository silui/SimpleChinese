//
//  ViewController.swift
//  Simple Chinese
//
//  Created by Luming Wang on 7/10/17.
//  Copyright © 2017 Luming Wang. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    @IBAction func BeginStudy(_ sender: Any)
    {
        let DoneStudying=UserDefaults.standard.bool(forKey: "DoneStudying")
        let VocabDefined=UserDefaults.standard.bool(forKey: "VocabDefined")
        if(DoneStudying==true)
        {
            performSegue(withIdentifier: "NavToQuiz", sender: self)
        }
        else if(VocabDefined==true)
        {
            performSegue(withIdentifier: "NavToStudy", sender: self)
        }
        else
        {
            performSegue(withIdentifier: "NavToNps", sender: self)
        }
    }
    @IBAction func ToReview(_ sender: Any)
    {
    }

    @IBAction func ResetUserDefault(_ sender: Any)
    {
        for key in Array(UserDefaults.standard.dictionaryRepresentation().keys)
        {
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
}

