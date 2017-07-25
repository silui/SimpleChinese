//
//  ViewController.swift
//  Controller class for navagation UI

import UIKit
class ViewController: UIViewController {
    
    //function for Study button pressed
    @IBAction func BeginStudy(_ sender: Any){
        if(UserDefaults.standard.bool(forKey: "NAVTOQUIZ")){
            performSegue(withIdentifier: "NAVTOQUIZ", sender: self)
        }
        else if(UserDefaults.standard.bool(forKey: "NAVTOSTUDY")){
            performSegue(withIdentifier: ("NAVTOSTUDY"), sender: self)
        }
        else{
            performSegue(withIdentifier: "NAVTONPS", sender: self)
        }
    }
 
    //function for Reset button pressed
    @IBAction func ResetUserDefault(_ sender: Any){
        let alert = UIAlertController(title: "Reseting will cause the system to lose all your progress", message: "Are you sure you still want to reset?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: Reset))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //helper function for ResetUserDefault
    func Reset(alertAction: UIAlertAction) {
        for key in Array(UserDefaults.standard.dictionaryRepresentation().keys){
            UserDefaults.standard.removeObject(forKey: key)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

