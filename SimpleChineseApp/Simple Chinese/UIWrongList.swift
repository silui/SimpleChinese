// UIWrongList.swift
// Controller class for the wrong list UI

import UIKit

class UIWrongList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var WLTableView: UITableView!

    var OriginalText = ""
    var StringParse: [String]=[]
    
    //table View definition
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (StringParse.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = StringParse[indexPath.row]
        return(cell)
    }
    
    
    //Load wrong.txt and display when controller is loading in
    override func viewDidLoad(){
        super.viewDidLoad()
        let fileName = "wrong"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")        
        //copy the previous text content
        
        do {
            OriginalText = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
        }
        StringParse = OriginalText.components(separatedBy: "\n")

    }
    
    //trigger function for Reset button
    @IBAction func Resetwronglist(_ sender: UIButton){
        //reseting wrong.txt back to empty
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
        //reload table view
        viewDidLoad()
        WLTableView.reloadData()
    }
}
