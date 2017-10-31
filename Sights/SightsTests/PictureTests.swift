//
//  PictureTests.swift
//  SightsTests
//
//  Created by WuJun on 30/10/2017.
//  Copyright © 2017 LeanCloud. All rights reserved.
//

import XCTest
import RxLeanCloud
import RxBlocking
import RxSwift
import RxTest

class PictureTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let app: RxAVApp = RxAVApp(appId: "uay57kigwe0b6f5n0e1d4z4xhydsml3dor24bzwvzr57wdap", appKey: "kfgz7jjfsk55r5a8a3y4ttd3je1ko11bkibcikonk32oozww")
        let sdk = RxAVClient.initialize(app: app)
        sdk.toggleLog(enable: true)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testNewPictureObject() {
        let todo = RxAVObject(className: "Picture")
        todo["foo"] = "bar"
        let result = todo.save()
            .toBlocking()
            .materialize()
        
        switch result {
        case .completed(let elements):
            print(elements[0].createdAt)
        //XCTFail("Expected result to complete with error, but result was successful.")
        case .failed(let elements, let error):
            print(error.localizedDescription)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
