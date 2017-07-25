//  LoadVocab.swift
//  Helper class for loading vocabset

import Foundation
class LoadVocab{
    static let VocabSet=["1st Grade", "2nd Grade"]
    
    //function takes reference array and int as input and put the parsed array to the array input
    static func PutInArrayCustom( ArrayRef:inout [String], set: Int){
        if(set==1){
            if let path = Bundle.main.path(forResource: "1stGrade", ofType: "txt"){
                do{
                    let data = try String(contentsOfFile: path, encoding: .utf8)
                    ArrayRef = data.components(separatedBy: .whitespacesAndNewlines)
                    //myStrings contain the whole txt parced into array
                }
                catch{
                    print("error")
                }
            }
        }
        else if (set==2){
            if let path = Bundle.main.path(forResource: "2ndGrade", ofType: "txt"){
                do{
                    let data = try String(contentsOfFile: path, encoding: .utf8)
                    ArrayRef = data.components(separatedBy: .whitespacesAndNewlines)
                    //myStrings contain the whole txt parced into array
                }
                catch{
                    print("error")
                }
            }
        }
    }
    
    //function that takes array as reference input and load it with parsed UserDefaults vocab set
    static func PutInArrayDefault( ArrayRef:inout [String]){
        let VocabSet=UserDefaults.standard.integer(forKey: "VOCABSET")
        if(VocabSet==1){
            if let path = Bundle.main.path(forResource: "1stGrade", ofType: "txt"){
                do{
                    let data = try String(contentsOfFile: path, encoding: .utf8)
                    ArrayRef = data.components(separatedBy: .whitespacesAndNewlines)
                    //myStrings contain the whole txt parced into array
                }
                catch{
                    print("error")
                }
            }
        }
        else if(VocabSet==2){
            if let path = Bundle.main.path(forResource: "2ndGrade", ofType: "txt"){
                do{
                    let data = try String(contentsOfFile: path, encoding: .utf8)
                    ArrayRef = data.components(separatedBy: .whitespacesAndNewlines)
                    //myStrings contain the whole txt parced into array
                }
                catch{
                    print("error")
                }
            }
        }
    }
}
