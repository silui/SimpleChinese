//
//  ViewControllerReview.swift
//  Simple Chinese
//
//  Created by Yibo Fu on 7/13/17.
//  Copyright © 2017 Luming Wang. All rights reserved.
//

import UIKit

class ViewControllerQuiz: UIViewController {
    
    @IBOutlet weak var label_PInYin: UILabel!
    @IBOutlet weak var label_Character: UILabel!
    @IBOutlet weak var ansA: UIButton!
    @IBOutlet weak var ansB: UIButton!
    @IBOutlet weak var ansC: UIButton!
    @IBOutlet weak var ansD: UIButton!
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var nextProb: UIButton!
    @IBOutlet weak var ConclusionUI: UIButton!
    
    @IBOutlet weak var button_ReturnToMain: UIButton!
    
    
    var myStrings : [String]=[]
    let vps = UserDefaults.standard.integer(forKey: "vps")
    var numOfClicks = 0
    
    var random1 = 1000
    var random2 = 1000
    var random3 = 1000
    var current=UserDefaults.standard.integer(forKey: "ArrayProgress")
    
    //for conclusionUI
    var numOfRight = 0
    var numOfWrong = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ansA.layer.borderWidth=1
        ansA.layer.borderColor=UIColor.black.cgColor
        ansB.layer.borderWidth=1
        ansB.layer.borderColor=UIColor.black.cgColor
        ansC.layer.borderWidth=1
        ansC.layer.borderColor=UIColor.black.cgColor
        ansD.layer.borderWidth=1
        ansD.layer.borderColor=UIColor.black.cgColor
        
        
        LoadVocab.PutInArrayDefault(ArrayRef: &myStrings)
        
        label_Character.text=myStrings[current]
        label_PInYin.text=myStrings[current+1]
        randomAnswer()
        
    }
    
    //Random for wrong explanation
    func randomAnswer()
    {
        let upperbound=UInt32((myStrings.count-3)/3)
        random1 = 3*Int(arc4random_uniform(upperbound))+2
        random2 = 3*Int(arc4random_uniform(upperbound))+2
        random3 = 3*Int(arc4random_uniform(upperbound))+2
        if random1 == current+2
        {
            random1 = 3*Int(arc4random_uniform(upperbound))+2
        }
        if random2 == current+2 || random2 == random1
        {
            random2 = 3*Int(arc4random_uniform(upperbound))+2
        }
        if random3 == current+2 || random3 == random1 || random3 == random2
        {
            random3 = 3*Int(arc4random_uniform(upperbound))+2
        }
        
        ansA.setTitle(myStrings[current+2], for: .normal)
        ansB.setTitle(myStrings[random1], for: .normal)
        ansC.setTitle(myStrings[random2], for: .normal)
        ansD.setTitle(myStrings[random3], for: .normal)
    }
    
    @IBAction func answerA(_ sender: Any)
    {
        result.isHidden = false
        if myStrings[current+2] == myStrings[current+2]
        {
            result.text = "Correct"
            numOfRight += numOfRight
        }
        else
        {
            result.text = "Incorrect, the correct answer is \"\(myStrings[current+2])\""
            numOfWrong += numOfWrong
        }
        nextProb.isHidden = false
    }
    @IBAction func answerB(_ sender: Any)
    {
        result.isHidden = false
        if myStrings[random1] == myStrings[current+2]
        {
            result.text = "Correct"
            numOfRight += numOfRight
        }
        else
        {
            result.text = "Incorrect, the correct answer is \"\(myStrings[current+2])\""
            numOfWrong += numOfWrong
        }
        nextProb.isHidden = false
    }
    @IBAction func answerC(_ sender: Any)
    {
        result.isHidden = false
        if myStrings[random2] == myStrings[current+2]
        {
            result.text = "Correct"
            numOfRight += numOfRight
        }
        else
        {
            result.text = "Incorrect, the correct answer is \"\(myStrings[current+2])\""
            numOfWrong += numOfWrong
        }
        nextProb.isHidden = false
    }
    @IBAction func answerD(_ sender: Any)
    {
        result.isHidden = false
        if myStrings[random3] == myStrings[current+2]
        {
            result.text = "Correct"
            numOfRight += numOfRight
        }
        else
        {
            result.text = "Incorrect, the correct answer is \"\(myStrings[current+2])\""
            numOfWrong += numOfWrong
        }
        nextProb.isHidden = false
    }
    
    @IBAction func nextProb(_ sender: Any)
    {
        numOfClicks = numOfClicks + 1
        result.isHidden = true
        nextProb.isHidden = true
        current = current + 3
        //print("numOfClicks: \(numOfClicks), vps: \(vps), current: \(current)")
        if(numOfClicks < vps)
        {
            UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "ArrayProgress")+3, forKey: "ArrayProgress")
            DisplayNewSet()
        }
        else
        {
            UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "ArrayProgress")+3, forKey: "ArrayProgress")
            ConclusionUI.isHidden = false
        }
    }
    
    func DisplayNewSet()
    {
        label_Character.text=myStrings[UserDefaults.standard.integer(forKey: "ArrayProgress")]
        label_PInYin.text=myStrings[UserDefaults.standard.integer(forKey: "ArrayProgress")+1]
        randomAnswer()
    }
    
}

