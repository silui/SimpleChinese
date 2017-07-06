//
//  ViewController.swift
//  TimeArchive
//
//  Created by Mac User on 7/12/17.
//  Copyright © 2017 Mac User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var ArchiveDisplay: UILabel!
    @IBAction func SaveTime(_ sender: Any)
    {
        ArchiveTime.setArchiveTime()
    }
    

    
    @IBAction func DisplayTime(_ sender: Any)
    {
        if let x = UserDefaults.standard.object(forKey: "InitialDate")as? Date
        {
            ArchiveDisplay.text=String(describing: x)
        }
    }
}

