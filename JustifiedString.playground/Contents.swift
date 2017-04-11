//: Playground - noun: a place where people can play

import UIKit

// Problem:
// Given a String of n characteres, return a string of k desired characters by inserting evenly spaces between words

func justifiedString(text:String, desiredLenght:Int) -> String {
	// Take the diference between the current number of character and the desired number of characters
	let lenghtDiff = desiredLenght - text.characters.count;
	
	// If the desired lenght is shorter than the current lenght, return the current string as it is
	if lenghtDiff <= 0 {
		print ("returned")
		return text
	}
	
	// Separe the string by words in an Array
	let words = text.components(separatedBy: " ")
	
	//Divide the diference of characters between the current number of spaces of the string
	let spaces = lenghtDiff / (words.count-1)
	
	//Create a new string with the calculated number of spaces, having in mind that you have to add the space that the current string has between words
	let spacesStr = String(repeating:" ", count:spaces+1)
	
	var finalStr = ""
	
	for i in 0..<(words.count-1) {
		print(words[i])
		//Concatenate each word with the calculated spaces for it
		finalStr += words[i] + spacesStr
		//If the difference between current characters and desired charactes is odd, you have to add an additional space.
		//Let's do it after the first word
		if (lenghtDiff%2 != 0 && i == 0) {
			finalStr += " "
		}
	}
	//Don't forget to add the last word
	finalStr += words[words.count-1]
	
	return finalStr
}

var stringName = justifiedString(text: "pepa perez cruz", desiredLenght: 22)
print(stringName)
print(stringName.characters.count)
