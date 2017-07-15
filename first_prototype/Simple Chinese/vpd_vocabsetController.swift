//
//  vpd_vocabsetController.swift
//  Simple Chinese
//
//  Created by Tian Qiu on 7/14/17.
//  Copyright © 2017 Luming Wang. All rights reserved.
//

import UIKit

class vpd_vocabsetController: UIViewController {

    @IBOutlet weak var vpd_display: UILabel!
    @IBOutlet weak var vpd_slider: UISlider!
    
    var vpd = 25;
    
    
    @IBAction func vpd_slider_slide(_ sender: Any){
        vpd = Int(vpd_slider.value)
        vpd_display.text="\(vpd) words per day"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var myStrings : [String]=[]
        if let path = Bundle.main.path(forResource: "1stGrade", ofType: "txt")
        {
            do
            {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                myStrings = data.components(separatedBy: .whitespacesAndNewlines)
                //myStrings contain the whole txt parced into array
            }
            catch
            {
                print("error")
            }
            
        }
        let StudyController = segue.destination as! ViewControllerStudy
        var internalSelector=0
        var vpd_walker=0
        while(vpd_walker != vpd && internalSelector<myStrings.count)
        {
            //print("vpd=\(vpd) vpdwalker=\(vpd_walker)")
            //print(internalSelector)
            if(UserDefaults.standard.bool(forKey: myStrings[internalSelector])==false)
            {
                vpd_walker+=1
                StudyController.CharacterArray.append(myStrings[internalSelector])
                StudyController.PinyinArray.append(myStrings[internalSelector+1])
                StudyController.DefinitionArray.append(myStrings[internalSelector+2])
                internalSelector+=3
            }
            else
            {
                internalSelector+=3
            }
        }
        UserDefaults.standard.set(true, forKey: "VocabDefined")
        UserDefaults.standard.set(Date(), forKey: "LastUsedDate")
}
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
