//
//  ViewControllerReview.swift
//  Simple Chinese
//
//  Created by Yibo Fu on 7/13/17.
//  Copyright © 2017 Luming Wang. All rights reserved.
//

import UIKit

class ViewControllerQuiz: UIViewController {
    
    @IBOutlet weak var label_PInYin: UILabel!
    @IBOutlet weak var label_Character: UILabel!
    @IBOutlet weak var label_SelectionA: UILabel!
    @IBOutlet weak var label_SelectionB: UILabel!
    @IBOutlet weak var label_SelectionC: UILabel!
    @IBOutlet weak var label_SelectionD: UILabel!
    @IBOutlet weak var button_ReturnToMain: UIButton!
    var myStrings : [String]=[]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadVocabSet()
        let current=UserDefaults.standard.integer(forKey: "ArrayProgress")
        label_Character.text=myStrings[current]
        label_PInYin.text=myStrings[current+1]
    }
    
    func loadVocabSet()
    {
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
    }
    
}

