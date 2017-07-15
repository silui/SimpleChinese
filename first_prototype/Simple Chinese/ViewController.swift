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
        if(UserDefaults.standard.bool(forKey: "VocabDefined")==false )
        {
            self.performSegue(withIdentifier: "SetVocab", sender: self)
        }
        else
        {
            self.performSegue(withIdentifier: "seguetoStudy", sender: self)
        }
    }
    @IBAction func ToReview(_ sender: Any)
    {
        print(UserDefaults.standard.bool(forKey: "OverTime"))
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



