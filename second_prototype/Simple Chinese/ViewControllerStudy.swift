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
        UserDefaults.standard.set(true, forKey: "DoneStudying")
        let vps=UserDefaults.standard.integer(forKey: "vps")
        let target=UserDefaults.standard.integer(forKey: "TargetProgress")
        UserDefaults.standard.set(target-(vps*3)+3, forKey: "ArrayProgress")
    }
    @IBAction func PrevVocab(_ sender: Any)
    {
        var target=UserDefaults.standard.integer(forKey: "TargetProgress")
        var current=UserDefaults.standard.integer(forKey: "ArrayProgress")
        let vps=UserDefaults.standard.integer(forKey: "vps")
        let lowerbound : Int = target-(vps*3)+3
        let QuizButtonShowed=UserDefaults.standard.bool(forKey: "QuizButtonShowed")
        if(QuizButtonShowed==true)
        {
            QuizButton.isHidden=false
        }
        if(current==lowerbound)
        {
        }
        else
        {
            UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "ArrayProgress")-3, forKey: "ArrayProgress")
            DisplayNewSet()
        }
        target=UserDefaults.standard.integer(forKey: "TargetProgress")
        current=UserDefaults.standard.integer(forKey: "ArrayProgress")
        if(lowerbound==current)
        {
            PrevBut.isHidden=true
        }
        else
        {
            NextBut.isHidden=false
            PrevBut.isHidden=false
        }
    }

    @IBAction func NextVocab(_ sender: Any)
    {
        var target=UserDefaults.standard.integer(forKey: "TargetProgress")
        var current=UserDefaults.standard.integer(forKey: "ArrayProgress")
        let QuizButtonShowed=UserDefaults.standard.bool(forKey: "QuizButtonShowed")
        if(QuizButtonShowed==true)
        {
            QuizButton.isHidden=false
        }
        if(target==current)
        {
        }
        else if(target-3==current)
        {
            UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "ArrayProgress")+3, forKey: "ArrayProgress")
            DisplayNewSet()
            QuizButton.isHidden=false
            UserDefaults.standard.set(true, forKey: "QuizButtonShowed")

        }
        else
        {
            UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "ArrayProgress")+3, forKey: "ArrayProgress")
            DisplayNewSet()
        }
        target=UserDefaults.standard.integer(forKey: "TargetProgress")
        current=UserDefaults.standard.integer(forKey: "ArrayProgress")
        if(target==current)
        {
            NextBut.isHidden=true
        }
        else
        {
            PrevBut.isHidden=false
            NextBut.isHidden=false
        }

    }
    
    func DisplayNewSet()
    {
        CharField.text=myStrings[UserDefaults.standard.integer(forKey: "ArrayProgress")]
        PinyinField.text=myStrings[UserDefaults.standard.integer(forKey: "ArrayProgress")+1]
        DefField.text=myStrings[UserDefaults.standard.integer(forKey: "ArrayProgress")+2]
    }

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        LoadVocab.PutInArrayDefault(ArrayRef: &myStrings)
        DisplayNewSet()
        let vps=UserDefaults.standard.integer(forKey: "vps")
        let current=UserDefaults.standard.integer(forKey: "ArrayProgress")
        let target=UserDefaults.standard.integer(forKey: "TargetProgress")
        let lowerbound : Int = target-(vps*3)+3
        let NeedNewSet=UserDefaults.standard.bool(forKey: "NeedNewSet")
        let QuizButtonShowed : Bool = UserDefaults.standard.bool(forKey: "QuizButtonShowed")
        print(lowerbound)
        if(current==target && target==0)  //first time user, set set target
        {
            UserDefaults.standard.set(vps*3-3, forKey: "TargetProgress")
            PrevBut.isHidden=true
        }
        else if(NeedNewSet==true)       //finished quiz and need new set
        {
            UserDefaults.standard.set(target+vps*3, forKey: "TargetProgress")
            PrevBut.isHidden=true
        }
        else if (current==target)   //just so happen he is lookat the last vocab in the range
        {
            NextBut.isHidden=true
        }
        else if (current==lowerbound)
        {
            PrevBut.isHidden=true
        }
        if(QuizButtonShowed==true)
        {
            QuizButton.isHidden=false
        }
    }
    
}
