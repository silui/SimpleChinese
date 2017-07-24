//
//  PercentTester.swift
//  PercentTester
//
//  Created by Tian Qiu on 7/23/17.
//  Copyright © 2017 Luming Wang. All rights reserved.
//

import XCTest
@testable import Simple_Chinese
class PercentTester: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTruePercet(){
        let myClass=ViewControllerConclusion()
        let testarray: [Bool] = [true, false, true, false]
        let theorticalPercet: Int = 50
        XCTAssertEqual(myClass.TruePercent(array: testarray),theorticalPercet )
        
    }
    
}
