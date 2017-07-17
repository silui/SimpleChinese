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
    
    @IBOutlet weak var Char: UILabel!
    @IBOutlet weak var TorF: UILabel!
    
    var passChar :[String] = []
    var passTorF :[Bool] = []
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (passChar.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = passChar[indexPath.row]
        
        return(cell)
    }
    
    
    
    override func viewDidLoad() {
        print("passChar:\(passChar), passTorF \(passTorF)")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
