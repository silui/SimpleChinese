//
//  LoadVocab.swift
//  Simple Chinese
//
//  Created by Mac User on 7/8/17.
//  Copyright © 2017 Luming Wang. All rights reserved.
//

import Foundation
class LoadVocab
{
    static func PutInArrayCustom( ArrayRef:inout [String], set: Int)
    {
        
        if(set==1){
            if let path = Bundle.main.path(forResource: "1stGrade", ofType: "txt")
            {
                do
                {
                    let data = try String(contentsOfFile: path, encoding: .utf8)
                    ArrayRef = data.components(separatedBy: .whitespacesAndNewlines)
                    //myStrings contain the whole txt parced into array
                }
                catch
                {
                    print("error")
                }
            }
        }
        else if (set==2)
        {
            if let path = Bundle.main.path(forResource: "2ndGrade", ofType: "txt")
            {
                do
                {
                    let data = try String(contentsOfFile: path, encoding: .utf8)
                    ArrayRef = data.components(separatedBy: .whitespacesAndNewlines)
                    //myStrings contain the whole txt parced into array
                }
                catch
                {
                    print("error")
                }
            }
        }
        else if (set==3)
        {
            if let path = Bundle.main.path(forResource: "Test1", ofType: "txt")
            {
                do
                {
                    let data = try String(contentsOfFile: path, encoding: .utf8)
                    ArrayRef = data.components(separatedBy: .whitespacesAndNewlines)
                    //myStrings contain the whole txt parced into array
                }
                catch
                {
                    print("error")
                }
            }
        }
        
    }
    static func PutInArrayDefault( ArrayRef:inout [String])
    {
        let VocabSet=UserDefaults.standard.integer(forKey: "VocabSet")
        if(VocabSet==1)
        {
            if let path = Bundle.main.path(forResource: "1stGrade", ofType: "txt")
            {
                do
                {
                    let data = try String(contentsOfFile: path, encoding: .utf8)
                    ArrayRef = data.components(separatedBy: .whitespacesAndNewlines)
                    //myStrings contain the whole txt parced into array
                }
                catch
                {
                    print("error")
                }
            }
        }
        else if(VocabSet==2)
        {
            if let path = Bundle.main.path(forResource: "2ndGrade", ofType: "txt")
            {
                do
                {
                    let data = try String(contentsOfFile: path, encoding: .utf8)
                    ArrayRef = data.components(separatedBy: .whitespacesAndNewlines)
                    //myStrings contain the whole txt parced into array
                }
                catch
                {
                    print("error")
                }
            }
        }
    }
}
