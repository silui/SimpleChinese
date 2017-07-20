//
//  OverViewController.swift
//  Simple Chinese
//
//  Created by Tian Qiu on 7/16/17.
//  Copyright © 2017 Luming Wang. All rights reserved.
//

import UIKit

class OverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDataSource, UIPickerViewDelegate{

    var myStrings : [String]=[]
    let VocabSet=["1st Grade", "2nd Grade","Test1"]
    var Defaultselect=1
    
    @IBOutlet weak var PickerView: UIPickerView!
    @IBOutlet weak var TableView: UITableView!
    
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
        Defaultselect=row+1
        print(Defaultselect)
    }
    
    
    @IBAction func SetConfirm(_ sender: Any) {
        self.PickerView.isHidden=true
        LoadVocab.PutInArrayCustom(ArrayRef: &myStrings, set: Defaultselect)
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return myStrings.count/3
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! OverViewCell
            
            cell.Char_Field.text=myStrings[indexPath.row*3]
            cell.PinYin_Field.text=myStrings[indexPath.row*3+1]
            cell.Def_Field.text=myStrings[indexPath.row*3+2]
            return cell
        }
        TableView.reloadData()
        self.TableView.isHidden=false
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myStrings.count/3
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! OverViewCell

        cell.Char_Field.text=myStrings[indexPath.row*3]
        cell.PinYin_Field.text=myStrings[indexPath.row*3+1]
        cell.Def_Field.text=myStrings[indexPath.row*3+2]
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
