//ViewControllerConclusion.swift
//Controller class form the conclusion UI
import UIKit

class ViewControllerConclusion: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    
    var PassChar : [String] = []
    var PassTorF : [Bool] = []
    @IBOutlet weak var CorrectRate: UILabel!
    
    //tableview definition
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (PassChar.count)
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ConclusionCell
        if(PassTorF[indexPath.row] == true){
            cell.TorF.text="⭕️"
        }
        else{
            cell.TorF.text="❌"
        }
        cell.Character.text=PassChar[indexPath.row]
        return(cell)
    }
    
    //calculate number of true in a boolean array
    func NumOfTrueInArray(array: [Bool])->Int{
        var numOfCorrect = 0
        for i in 0...array.count-1{
            if(array[i] == true){
                numOfCorrect += 1
            }
        }
        return numOfCorrect

    }
    
    //calculate the percentage of true in a bool array
    func TruePercent(array: [Bool]) -> Int {
        var truecounter=0
        for i in 0...array.count-1{
            if(array[i]==true){
                truecounter+=1
            }
        }
        return (truecounter*100)/array.count;
    }
    
    
    //function execute when loading controller
    override func viewDidLoad(){
        super.viewDidLoad()
        let text: String="You got \(String(NumOfTrueInArray(array: PassTorF)))/\(String(PassTorF.count))"
        CorrectRate.text=text
    }
}
