//
//  ViewControllerStudy.swift
//  Simple Chinese
//
//  Created by Yibo Fu on 7/11/17.
//  Copyright © 2017 Luming Wang. All rights reserved.
//

import UIKit

class ViewControllerStudy: UIViewController {

    @IBOutlet weak var PinyinField: UILabel!
    @IBOutlet weak var DefField: UILabel!
    @IBOutlet weak var CharField: UILabel!
    var CharacterArray = [String]()
    var PinyinArray = [String]()
    var DefinitionArray = [String]()
    
    var ArrayWalker=0;
    
    @IBOutlet weak var NextBut: UIButton!
    
    @IBOutlet weak var PrevBut: UIButton!
    
    @IBAction func PrevVocab(_ sender: Any) {
        if(ArrayWalker==0){}
        else
        {
            ArrayWalker-=1
            DisplayNewSet()
        }
    }

    @IBAction func NextVocab(_ sender: Any)
    {
        if ArrayWalker==CharacterArray.count-1{}
        else
        {
            ArrayWalker+=1
            DisplayNewSet()
        }
    }
    
    func DisplayNewSet(){
        PinyinField.text=PinyinArray[ArrayWalker]
        CharField.text=CharacterArray[ArrayWalker]
        DefField.text=DefinitionArray[ArrayWalker]
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        DisplayNewSet()
     }
    func loadVocabSet()
    {
        
    }


}
