//ViewControllerStudy.swift
//Controller class for Study UI

import UIKit
import AVFoundation
import Speech
class ViewControllerStudy: UIViewController, AVSpeechSynthesizerDelegate{

    let Synthesizer = AVSpeechSynthesizer()     //global variable for sound
    @IBOutlet weak var PinyinField: UILabel!
    @IBOutlet weak var DefField: UILabel!
    @IBOutlet weak var CharField: UILabel!
    @IBOutlet weak var QuizButton: UIButton!
    var MyStrings : [String]=[]         //global that store parsed txt file
    
    @IBOutlet weak var NextBut: UIButton!
    
    @IBOutlet weak var PrevBut: UIButton!
    
    //Quiz button trigger
    @IBAction func QuizButtonPressed(_ sender: Any){
        UserDefaults.standard.set(true, forKey: "NAVTOQUIZ")
        UserDefaults.standard.set(false, forKey: "NAVTOSTUDY")
    }
    
    //PrevVocab button trigger
    @IBAction func PrevVocab(_ sender: Any){
        if(PrevBut.isHidden==false){
            let lowerbound=UserDefaults.standard.integer(forKey: "LOWERBOUND")
            let current=UserDefaults.standard.integer(forKey: "ARRAYPROGRESS")
            if(current==lowerbound){
                print("ERROR: Class: ViewControllerStudy, func:PrevVocab, cond: current=lowerbound\nComment: prevbutton should already be hidden when lowerbound=current")
            }
            UserDefaults.standard.set(current-3, forKey: "ARRAYPROGRESS")
            DisplayNewSet()
            Checkbutton()
        }
    }
    
    //NextVocab button trigger
    @IBAction func NextVocab(_ sender: Any){
        if(NextBut.isHidden==false){
            let target=UserDefaults.standard.integer(forKey: "TARGETPROGRESS")
            let current=UserDefaults.standard.integer(forKey: "ARRAYPROGRESS")
            if(target==current){
                print("ERROR: Class: ViewControllerStudy, func:NextVocab, cond: target=current\nComment: nextbutton should already be hidden when target=current")
            }
            UserDefaults.standard.set(current+3, forKey: "ARRAYPROGRESS")
            DisplayNewSet()
            Checkbutton()
        }
    }
    
    //Speak button trigger
    @IBAction func Speak(_ sender: UIButton) {
        let current=UserDefaults.standard.integer(forKey: "ARRAYPROGRESS")
        Speakfunction(Chinese: MyStrings[current])
    }
    
    //helper function to update char, PY and def field
    func DisplayNewSet()
    {
        let arraywalker=UserDefaults.standard.integer(forKey: "ARRAYPROGRESS")
        CharField.text=MyStrings[arraywalker]
        PinyinField.text=MyStrings[arraywalker+1]
        DefField.text=MyStrings[arraywalker+2]
        
    }
    
    //helper function to check what button need to be shown
    func Checkbutton()
    {
        let lower=UserDefaults.standard.integer(forKey: "LOWERBOUND")
        let current=UserDefaults.standard.integer(forKey: "ARRAYPROGRESS")
        let upper=UserDefaults.standard.integer(forKey: "TARGETPROGRESS")
        if(current==lower){
            PrevBut.isHidden=true
        }
        else{
            PrevBut.isHidden=false
        }
        if(current==upper){
            NextBut.isHidden=true
            UserDefaults.standard.set(true, forKey: "QUIZBUTTONSHOWED")
        }
        else{
            NextBut.isHidden=false
        }
        let quizButtonShowed : Bool = UserDefaults.standard.bool(forKey: "QUIZBUTTONSHOWED")
        QuizButton.isHidden = !quizButtonShowed
    }


    override func viewDidLoad(){
        super.viewDidLoad()
        LoadVocab.PutInArrayDefault(ArrayRef: &MyStrings)
        let vps=UserDefaults.standard.integer(forKey: "VPS")
        var target=UserDefaults.standard.integer(forKey: "TARGETPROGRESS")
        let needNewSet=UserDefaults.standard.bool(forKey: "NEEDNEWSET") //meaning done need anther set of vocab with vps or less than vps amount
        if(needNewSet){
            let ideaupperbound=target+vps*3
            target+=3
            UserDefaults.standard.set(target, forKey: "LOWERBOUND")
            UserDefaults.standard.set(target, forKey: "ARRAYPROGRESS")
            let stingupperbound=MyStrings.count-4
            print(MyStrings.count)
            UserDefaults.standard.set(min(ideaupperbound, stingupperbound), forKey: "TARGETPROGRESS")
            UserDefaults.standard.set(false, forKey: "NEEDNEWSET")
            UserDefaults.standard.set(false, forKey: "QUIZBUTTONSHOWED")
        }
        DisplayNewSet()
        Checkbutton()
    }
    
    //golbal function that takes String as input and output sound
    func Speakfunction(Chinese: String){
        let textparah = Chinese.components(separatedBy: "\n")
        if !self.Synthesizer.isSpeaking{
            for piecetext in textparah {
                let speech = AVSpeechUtterance(string: piecetext)
                let voice = AVSpeechSynthesisVoice(language: "zh-CN")
                speech.voice = voice
                speech.rate = 0.5
                self.Synthesizer.speak(speech)
            }
        }else{
            self.Synthesizer.continueSpeaking()
        }

    }
}
