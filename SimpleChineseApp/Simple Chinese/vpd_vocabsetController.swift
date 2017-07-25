//  vpd_vocabsetController.swift
//  controller class for vpd selector
import UIKit

class vpd_vocabsetController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    let VocabSet=LoadVocab.VocabSet     //String array for available vocab set
    
    //pickerview definition
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
    var Vps=25         //global variable for words per session
    
    //Slider trigger that updates Vps display
    @IBAction func Vps_slider_slide(_ sender: Any) {
        Vps = Int(Vps_slider.value)
        Vps_display.text="\(Vps) words per session"
    }
    
    //segue preparation
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
        UserDefaults.standard.set(1, forKey: "VOCABSET")   //in case user didn't touch PickerView
    }

}
