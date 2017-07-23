//
//  ViewControllerStudy.swift
//  Simple Chinese
//
//  Created by Yibo Fu on 7/11/17.
//  Copyright © 2017 Luming Wang. All rights reserved.
//

import UIKit

class ViewControllerStudy: UIViewController {

    @IBOutlet weak var PinyinField: UILabel!
    @IBOutlet weak var DefField: UILabel!
    @IBOutlet weak var CharField: UILabel!
    @IBOutlet weak var QuizButton: UIButton!
    var myStrings : [String]=[]
    
    @IBOutlet weak var NextBut: UIButton!
    
    @IBOutlet weak var PrevBut: UIButton!
    
    @IBAction func QuizButtonPressed(_ sender: Any)
    {
        UserDefaults.standard.set(true, forKey: "NavToQuiz")
        UserDefaults.standard.set(false, forKey: "NavToStudy")
    }
    @IBAction func PrevVocab(_ sender: Any)
    {
        let lowerbound=UserDefaults.standard.integer(forKey: "LowerBound")
        let current=UserDefaults.standard.integer(forKey: "ArrayProgress")
        if(current==lowerbound)
        {
            print("ERROR: Class: ViewControllerStudy, func:PrevVocab, cond: current=lowerbound\nComment: prevbutton should already be hidden when lowerbound=current")
            
        }
        UserDefaults.standard.set(current-3, forKey: "ArrayProgress")
        DisplayNewSet()
        checkbutton()
    }

    @IBAction func NextVocab(_ sender: Any)
    {
        let target=UserDefaults.standard.integer(forKey: "TargetProgress")
        let current=UserDefaults.standard.integer(forKey: "ArrayProgress")
        if(target==current)
        {
            print("ERROR: Class: ViewControllerStudy, func:NextVocab, cond: target=current\nComment: nextbutton should already be hidden when target=current")
        }
        UserDefaults.standard.set(current+3, forKey: "ArrayProgress")
        DisplayNewSet()
        checkbutton()

    }
    
    func DisplayNewSet()
    {
        let arraywalker=UserDefaults.standard.integer(forKey: "ArrayProgress")
        CharField.text=myStrings[arraywalker]
        PinyinField.text=myStrings[arraywalker+1]
        DefField.text=myStrings[arraywalker+2]
        
    }
    func checkbutton()
    {
        let lower=UserDefaults.standard.integer(forKey: "LowerBound")
        let current=UserDefaults.standard.integer(forKey: "ArrayProgress")
        let upper=UserDefaults.standard.integer(forKey: "TargetProgress")
        if(current==lower){
            PrevBut.isHidden=true
        }
        else{
            PrevBut.isHidden=false
        }
        if(current==upper){
            NextBut.isHidden=true
            UserDefaults.standard.set(true, forKey: "QuizButtonShowed")
        }
        else{
            NextBut.isHidden=false
        }
        let QuizButtonShowed : Bool = UserDefaults.standard.bool(forKey: "QuizButtonShowed")
        QuizButton.isHidden = !QuizButtonShowed
    }


    override func viewDidLoad()
    {
        super.viewDidLoad()
        LoadVocab.PutInArrayDefault(ArrayRef: &myStrings)
        let vps=UserDefaults.standard.integer(forKey: "vps")
        var target=UserDefaults.standard.integer(forKey: "TargetProgress")
        let NeedNewSet=UserDefaults.standard.bool(forKey: "NeedNewSet") //meaning done need anther set of vocab with vps or less than vps amount
        if(NeedNewSet)
        {
            let ideaupperbound=target+vps*3
            target+=3
            UserDefaults.standard.set(target, forKey: "LowerBound")
            UserDefaults.standard.set(target, forKey: "ArrayProgress")
            let stingupperbound=myStrings.count-4
            print(myStrings.count)
            UserDefaults.standard.set(min(ideaupperbound, stingupperbound), forKey: "TargetProgress")
            UserDefaults.standard.set(false, forKey: "NeedNewSet")
            UserDefaults.standard.set(false, forKey: "QuizButtonShowed")
        }
        DisplayNewSet()
        checkbutton()
    }
    
}
