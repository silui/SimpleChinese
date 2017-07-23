//
//  vpd_vocabsetController.swift
//  Simple Chinese
//
//  Created by Tian Qiu on 7/14/17.
//  Copyright © 2017 Luming Wang. All rights reserved.
//

import UIKit

class vpd_vocabsetController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    let VocabSet=LoadVocab.VocabSet
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return VocabSet[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return VocabSet.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(row+1, forKey: "VOCABSET")        //memorize user chosen vocab set
    }
    @IBOutlet weak var Vps_display: UILabel!
    @IBOutlet weak var Vps_slider: UISlider!
    var Vps=25
    
    @IBAction func Vps_slider_slide(_ sender: Any) {
        Vps = Int(Vps_slider.value)
        Vps_display.text="\(Vps) words per session"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        UserDefaults.standard.set(true, forKey: "NAVTOSTUDY")
        UserDefaults.standard.set(false, forKey: "NAVTOQUIZ")
        UserDefaults.standard.set(Vps, forKey: "VPS")
        UserDefaults.standard.set(0, forKey: "ARRAYPROGRESS")
        UserDefaults.standard.set(0, forKey: "LOWERBOUND")
        var myStrings : [String]=[]
        LoadVocab.PutInArrayCustom(ArrayRef: &myStrings, set: UserDefaults.standard.integer(forKey: "VOCABSET"))
        let stringsupper : Int = myStrings.count-2
        
        UserDefaults.standard.set(min(stringsupper, Vps*3-3), forKey: "TARGETPROGRESS")
}
    

    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(1, forKey: "VOCABSET")      //in case user didn't roll the
    }

}
