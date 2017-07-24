//
//  UIWrongList.swift
//  Simple Chinese
//
//  Created by Zhufeng Chen on 2017/7/23.
//  Copyright © 2017年 Luming Wang. All rights reserved.
//

import UIKit

class UIWrongList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var WLTableView: UITableView!

    var originalText = ""
    var StringParse: [String]=[]
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let fileName = "wrong"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("FilePath: \(fileURL.path)")
        
        //copy the previous text content
        
        do {
            originalText = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
        }
       // print(originalText)
        let Text: String=originalText
        StringParse = Text.components(separatedBy: "\n")

    }
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (StringParse.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = StringParse[indexPath.row]
        
        return(cell)
    }

    @IBAction func Resetwronglist(_ sender: UIButton)
    {
        let fileName = "wrong"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("FilePath: \(fileURL.path)")
        let resetText = ""
        do {
            // Write to the file
            try resetText.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
            cell.textLabel?.text = StringParse[indexPath.row]
            
            return(cell)
        }

        viewDidLoad()
        WLTableView.reloadData()
    }
    



}
