//
//  OverViewController.swift
//  Simple Chinese
//
//  Created by Tian Qiu on 7/16/17.
//  Copyright © 2017 Luming Wang. All rights reserved.
//

import UIKit

class OverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var myStrings : [String]=[]
    
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
        LoadVocab.PutInArrayCustom(ArrayRef: &myStrings,set: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
