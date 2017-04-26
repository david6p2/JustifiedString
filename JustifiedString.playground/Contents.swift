//: Playground - noun: a place where people can play

import UIKit

// Problem:
// Given a String of n characters, return a string of k desired characters by inserting evenly spaces between words

func justifyString(_ currentString:String, requiredLenght lenghtReq:Int) -> String {
	// lenght of the current string
	let currentLenght = currentString.characters.underestimatedCount
	// lenght of current string - required string
	let missingCharacters = lenghtReq - currentLenght
	
	// if is current lenght is less that the requiere lenght, return the current string
	if( missingCharacters <= 0){
		return currentString
	}
	
	// Divide the string by words
	// ex: david and mike, will be 3 words, 2 places to insert spaces
	let words = currentString.components(separatedBy: " ")
	
	// Count the number of words, and divide the numbers of missing Characters in the number of words - 1 (missingCharacters / words - 1)
    var numberOfSpaces = 1
    // Check if more than one word
    if words.count > 1 {
        numberOfSpaces = missingCharacters/(words.count - 1)
    }
	
	
	let spaces = String(repeating: " ", count: numberOfSpaces+1)
	
	// Calculate if the calculated missingCharacters are exaclty the number of spaces to be inserted
	var diferenceWithRequired = missingCharacters - (numberOfSpaces * (words.count - 1))
	
	//Concatenate String with new number of spaces
	var concatenatedString = ""
	
	for i in 0..<(words.count-1) {
		concatenatedString += words[i] + spaces
		//If there will be missing charactes, insert them evenly from left to right until there are not characters left
		if (diferenceWithRequired > 0){
			concatenatedString += " "
			diferenceWithRequired -= 1
		}
	}
	//Don't forget to add the last word
	concatenatedString += words[words.count-1]
	
	return concatenatedString
}

var stringName = justifyString("pepa perez cruz tas", requiredLenght: 30)
print(stringName)
print(stringName.characters.count)


import XCTest

class MyTests : XCTestCase {
    
    func testJustifiedStringLenght() {
        var justString = justifyString("string a", requiredLenght: 30)
        XCTAssert(justString.characters.count == 30)
    }
    
    func testPepaPerezExample() {
        var justString = justifyString("pepa perez cruz tas", requiredLenght: 30)
        XCTAssert(justString == "pepa     perez     cruz    tas")
    }
    
    func testOneWord() {
        var justString = justifyString("string", requiredLenght: 30)
        XCTAssert(justString.characters.count == 30)
    }
    
    func testTwoWords() {
        var justString = justifyString("a b", requiredLenght: 3)
        XCTAssert(justString == "a b")
    }
    
    func testTwoWordsLengthFive() {
        var justString = justifyString("a b", requiredLenght: 5)
        XCTAssert(justString == "a   b")
    }
}

class PlaygroundTestObserver : NSObject, XCTestObservation {
    @objc func testCase(testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: UInt) {
        print("Test failed on line \(lineNumber): \(testCase.name), \(description)")
    }
}

let observer = PlaygroundTestObserver()
let center = XCTestObservationCenter.shared()
center.addTestObserver(observer)

struct TestRunner {
    
    func runTests(testClass:AnyClass) {
        print("Running test suite \(testClass)")
        
        let tests = testClass as! XCTestCase.Type
        let testSuite = tests.defaultTestSuite()
        testSuite.run()
        let run = testSuite.testRun as! XCTestSuiteRun
        
        print("Ran \(run.executionCount) tests in \(run.testDuration)s with \(run.totalFailureCount) failures")
    }
}

TestRunner().runTests(testClass:MyTests.self)
