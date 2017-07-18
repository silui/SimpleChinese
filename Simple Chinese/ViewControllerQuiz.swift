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
    
    var correctAnswer = 0       //position of correct answer
    
    var myStrings : [String]=[]
    
    var randomIndexArray :[Int]=[]
    var current=0           //mystring index for current char
    
    var passChar :[String] = []
    var passTorF :[Bool] = []
    
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
        
        let upperbound=UserDefaults.standard.integer(forKey: "TargetProgress")
        let vps=UserDefaults.standard.integer(forKey: "vps")
        current=upperbound - 3*(vps-1)
        correctAnswer=randomAnswerPlace()
        
        DisplayNewSet()
        randomAnswer()      //get mystrings index for wrong answer
        putrandomanswer()       //set title for answers
        
    }
    
    
    func putrandomanswer()
    {
        var arrayWalker=0
        if(correctAnswer==1)
        {
            ansA.setTitle(myStrings[current+2], for: .normal)
        }
        else
        {
            ansA.setTitle(myStrings[randomIndexArray[arrayWalker]], for: .normal)
            arrayWalker+=1
        }
        if(correctAnswer==2)
        {
            ansB.setTitle(myStrings[current+2], for: .normal)
        }
        else
        {
            ansB.setTitle(myStrings[randomIndexArray[arrayWalker]], for: .normal)
            arrayWalker+=1
        }
        if(correctAnswer==3)
        {
            ansC.setTitle(myStrings[current+2], for: .normal)
        }
        else
        {
            ansC.setTitle(myStrings[randomIndexArray[arrayWalker]], for: .normal)
            arrayWalker+=1
        }
        if(correctAnswer==4)
        {
            ansD.setTitle(myStrings[current+2], for: .normal)
        }
        else
        {
            ansD.setTitle(myStrings[randomIndexArray[arrayWalker]], for: .normal)
            arrayWalker+=1
        }
    }
    
    
    
    
    //Random for wrong explanation
    func randomAnswer()
    {
        let upperbound=UInt32((myStrings.count-3)/3)
        var random1 = 3*Int(arc4random_uniform(upperbound))+2
        var random2 = 3*Int(arc4random_uniform(upperbound))+2
        var random3 = 3*Int(arc4random_uniform(upperbound))+2
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
        randomIndexArray.append(random1)
        randomIndexArray.append(random2)
        randomIndexArray.append(random3)
    }
    
    func randomAnswerPlace()->Int
    {
        let randomPlace = arc4random_uniform(4) + 1
        return Int(randomPlace)
        //随机return1-4的value
    }
    
    @IBAction func pickAnswer(_ sender: Any)
    {
        if(result.isHidden == true)
        {
            let Answertag:Int = (sender as AnyObject).tag
            result.isHidden = false
            if Answertag == correctAnswer
            {
                result.text = "Correct"
                passTorF.append(true)
                
                
            }
            else
            {
                result.text = "Incorrect, the correct answer is \"\(myStrings[current+2])\""
                passTorF.append(false)
            
                //pick incorrect options goes here
                let fileName = "Test1"
                let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                
                let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
                print("FilePath: \(fileURL.path)")
                
                //copy the previous text content
                var originalText = ""
                do {
                    originalText = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)
                } catch let error as NSError {
                    print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
                }
                
                //copy of the total context.
                let toPutIn = myStrings[current]+" "+myStrings[current+1]+" "+myStrings[current+2]+"\n"
                let writeString = originalText + "\n" + toPutIn
                
                do {
                    // Write to the file
                    try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
                } catch let error as NSError {
                    print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
                }
                
                var readString = "" // Used to store the file contents
                do {
                    // Read the file contents
                    readString = try String(contentsOf: fileURL)
                } catch let error as NSError {
                    print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
                }
                print("File Text: \(readString)")
                //end of list incorrect char
                
                
            }
            if(current == UserDefaults.standard.integer(forKey: "TargetProgress"))
            {
                nextProb.isHidden = true
                ConclusionUI.isHidden = false
                UserDefaults.standard.set(false, forKey: "DoneStudying")
                let current=UserDefaults.standard.integer(forKey: "TargetProgress")
                let vps=UserDefaults.standard.integer(forKey: "vps")
                UserDefaults.standard.set((vps*3)+current, forKey: "TargetProgress")
                UserDefaults.standard.set(true, forKey: "NeedNewSet")
                
            }
            else{
                nextProb.isHidden = false
            }
            
        }
    }
    
    @IBAction func nextProb(_ sender: Any)
    {
        current = current + 3
        randomIndexArray = []
        result.isHidden = true
        nextProb.isHidden = true
        
        correctAnswer=randomAnswerPlace()       //get correct answer place in 1-4
        randomAnswer()      //get mystrings index for wrong answer
        putrandomanswer()       //set title for answers
        DisplayNewSet()
        
    }
    
    func DisplayNewSet()
    {
        label_Character.text=myStrings[current]
        passChar.append(myStrings[current])
        label_PInYin.text=myStrings[current+1]
        randomAnswer()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="QuizToConclusion")
        {
            let passData = segue.destination as! ViewControllerConclusion
            passData.passChar = passChar
            passData.passTorF = passTorF
        }
    }
    

}

