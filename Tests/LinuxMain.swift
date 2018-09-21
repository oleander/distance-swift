import XCTest

import DistanceTests

var tests = [XCTestCaseEntry]()
tests += DistanceTests.allTests()
XCTMain(tests)