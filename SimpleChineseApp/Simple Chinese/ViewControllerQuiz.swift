//ViewControllerQuiz.swift
//Controller class for Quiz UI
import UIKit

class ViewControllerQuiz: UIViewController {
    
    @IBOutlet weak var Label_PInYin: UILabel!
    @IBOutlet weak var Label_Character: UILabel!
    @IBOutlet weak var AnsA: UIButton!
    @IBOutlet weak var AnsB: UIButton!
    @IBOutlet weak var AnsC: UIButton!
    @IBOutlet weak var AnsD: UIButton!
    
    @IBOutlet weak var Result: UILabel!
    @IBOutlet weak var NextProb: UIButton!
    @IBOutlet weak var ConclusionUI: UIButton!
    
    @IBOutlet weak var Button_ReturnToMain: UIButton!
    
    var CorrectAnswer = 0       //position of correct answer
    
    var MyStrings : [String]=[]
    
    var RandomIndexArray :[Int]=[]      //array that stores randomly generated mystrings index
    var Current=0           //mystring index for current char
    
    var PassChar :[String] = []
    var PassTorF :[Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Add frames to the answer
        AnsA.layer.borderWidth=1
        AnsA.layer.borderColor=UIColor(red:80/255.0, green:35/255.0, blue:35/255.0, alpha: 0.75).cgColor
        AnsB.layer.borderWidth=1
        AnsB.layer.borderColor=UIColor(red:80/255.0, green:35/255.0, blue:35/255.0, alpha: 0.75).cgColor
        AnsC.layer.borderWidth=1
        AnsC.layer.borderColor=UIColor(red:80/255.0, green:35/255.0, blue:35/255.0, alpha: 0.75).cgColor
        AnsD.layer.borderWidth=1
        AnsD.layer.borderColor=UIColor(red:80/255.0, green:35/255.0, blue:35/255.0, alpha: 0.75).cgColor
        
        LoadVocab.PutInArrayDefault(ArrayRef: &MyStrings)
        
        let upperbound=UserDefaults.standard.integer(forKey: "TARGETPROGRESS")
        let vps=UserDefaults.standard.integer(forKey: "VPS")
        Current=upperbound - 3*(vps-1)
        CorrectAnswer=RandomAnswerPlace()
        
        DisplayNewSet()
        PickRandomDef()      //get MyStrings index for wrong answer
        PutRandomAnswer()       //set title for answers
        
    }
    
    func PickRandomDef(){       //gen 3 random MyStrings value that are not the same with current and each other
        let upperbound=UInt32((MyStrings.count-3)/3)
        for _ in 0...2{
            RandomIndexArray.append(3*Int(arc4random_uniform(upperbound))+2)
            
        }
        while(DoesArrayContainDuplicate(array: RandomIndexArray)==true){
            for i in 0...2{
                RandomIndexArray[i]=3*Int(arc4random_uniform(upperbound))+2
            }
        }
    }
    
    func DoesArrayContainDuplicate(array: [Int])->Bool{      //helper function for PickRandomDef() that checks if random value contains dublicate and same with current
        for a in 0...array.count-1{
            if(array[a]==Current+2){
                return true
            }
            for b in 0...array.count-1{
                if(a != b){
                    if(array[a] == array[b]){
                        return true
                    }
                }
            }
        }
        return false
    }
    
    //By using PickRandomDef variable, we can put answers in random places
    func PutRandomAnswer(){
        var arrayWalker=0
        if(CorrectAnswer==1){
            AnsA.setTitle(MyStrings[Current+2], for: .normal)
        }
        else{
            AnsA.setTitle(MyStrings[RandomIndexArray[arrayWalker]], for: .normal)
            arrayWalker+=1
        }
        if(CorrectAnswer==2){
            AnsB.setTitle(MyStrings[Current+2], for: .normal)
        }
        else{
            AnsB.setTitle(MyStrings[RandomIndexArray[arrayWalker]], for: .normal)
            arrayWalker+=1
        }
        if(CorrectAnswer==3){
            AnsC.setTitle(MyStrings[Current+2], for: .normal)
        }
        else{
            AnsC.setTitle(MyStrings[RandomIndexArray[arrayWalker]], for: .normal)
            arrayWalker+=1
        }
        if(CorrectAnswer==4){
            AnsD.setTitle(MyStrings[Current+2], for: .normal)
        }
        else{
            AnsD.setTitle(MyStrings[RandomIndexArray[arrayWalker]], for: .normal)
            arrayWalker+=1
        }
    }
    
    //random pick value 1-4
    func RandomAnswerPlace()->Int{
        let randomPlace = arc4random_uniform(4) + 1
        return Int(randomPlace)
    }
    
    //trigger function for picking answer
    @IBAction func PickAnswer(_ sender: Any){
        if(Result.isHidden == true){
            let Answertag:Int = (sender as AnyObject).tag
            Result.isHidden = false
            if Answertag == CorrectAnswer{
                Result.text = "Correct"
                PassTorF.append(true)
            }
            else{
                Result.text = "Incorrect, the correct answer is \"\(MyStrings[Current+2])\""
                PassTorF.append(false)
               AddToWrongList(currentarg: Current, stringarray: MyStrings)
            }
            if(Current == UserDefaults.standard.integer(forKey: "TARGETPROGRESS")){
                //if it reach end of 1 session
                NextProb.isHidden = true
                ConclusionUI.isHidden = false
                if(Current==MyStrings.count-4){      //if it reach the end of 1 vocab set
                    let defindedset=UserDefaults.standard.integer(forKey: "VOCABSET")
                    let alert = UIAlertController(title: "Congraduation", message: "You finished the set \(LoadVocab.VocabSet[defindedset])", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    for key in Array(UserDefaults.standard.dictionaryRepresentation().keys){
                        UserDefaults.standard.removeObject(forKey: key)
                    }
                }
                else{
                    UserDefaults.standard.set(true, forKey: "NEEDNEWSET")
                    UserDefaults.standard.set(false, forKey: "NAVTOQUIZ")
                    UserDefaults.standard.set(true, forKey: "NAVTOSTUDY")
                }
            }
            else{
                NextProb.isHidden = false
            }
            
        }
    }
    
    //helperfunction that adds
    func AddToWrongList(currentarg: Int, stringarray: [String])
    {
        //pick incorrect options goes here
        let fileName = "wrong"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        //copy the previous text content
        var originalText = ""
        do {
            originalText = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
        }
        
        //copy of the total context.
        let toPutIn = stringarray[currentarg]+"      "+stringarray[currentarg+1]+"        "+stringarray[currentarg+2]+"\n"
        let writeString = originalText + "\n" + toPutIn
        
        do {
            // Write to the file
            try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
        }
    }
    
    //trigger function for next button
    @IBAction func NextProb(_ sender: Any)
    {
        Current = Current + 3
        RandomIndexArray = []
        Result.isHidden = true
        NextProb.isHidden = true
        
        CorrectAnswer=RandomAnswerPlace()       //get correct answer place in 1-4
        PickRandomDef()      //get MyStrings index for wrong answer
        PutRandomAnswer()       //set title for answers
        DisplayNewSet()
        
    }
    
    //helper function to change char and PY field text
    func DisplayNewSet()
    {
        Label_Character.text=MyStrings[Current]
        PassChar.append(MyStrings[Current])
        Label_PInYin.text=MyStrings[Current+1]
    }
    
    //segue function to pass 2 array into next controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="QUIZTOCONCLUSION")
        {
            let passData = segue.destination as! ViewControllerConclusion
            passData.PassChar = PassChar
            passData.PassTorF = PassTorF
            
        }
    }
}


