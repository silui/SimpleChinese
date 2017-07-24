//
//  ViewControllerConclusion.swift
//  Simple Chinese
//
//  Created by Luming Wang on 7/16/17.
//  Copyright © 2017 Luming Wang. All rights reserved.
//

import UIKit

class ViewControllerConclusion: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    
    var PassChar : [String] = []
    var PassTorF : [Bool] = []
    @IBOutlet weak var CorrectRate: UILabel!
    
    
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
    
    func CalculateCorrectRate(){
        var numOfCorrect = 0
        for i in 0...PassTorF.count-1{
            if(PassTorF[i] == true){
                numOfCorrect += 1
            }
        }
        CorrectRate.text = "You got " + String(numOfCorrect) + "/" + String(PassTorF.count) + " correct"
    }
    
    
    func TruePercent(array: [Bool]) -> Int {
        var truecounter=0
        for i in 0...array.count-1{
            if(array[i]==true){
                truecounter+=1
            }
        }
        return (truecounter*100)/array.count;
    }
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        CalculateCorrectRate()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
    }
}
