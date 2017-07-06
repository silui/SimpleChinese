//
//  File.swift
//  TimeArchive
//
//  Created by Mac User on 7/12/17.
//  Copyright © 2017 Mac User. All rights reserved.
//

import Foundation

class ArchiveTime {
    static func setArchiveTime()
    {
        let initalDate : Date = Date()
        let targetDate : Date = Date.init(timeIntervalSinceNow: 86400)
        print(String(describing: initalDate)+"\n")
        print(String(describing: targetDate)+"\n")
        print(initalDate<targetDate)
    }
}
