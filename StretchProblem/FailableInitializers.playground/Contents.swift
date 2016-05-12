//: Playground - noun: a place where people can play

import UIKit

class Person {
    
    private let nameKey = "name"
    private let ageKey = "age"
    private let favMovieKey = "favMovie"
    
    let name: String
    let age: Int
    let favMovie: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[nameKey] as? String, age = dictionary[ageKey] as? Int, favMovie = dictionary[favMovieKey] as? String else {
            return nil
        }
        self.name = name
        self.age = age
        self.favMovie = favMovie
    }
}


let workingDictionary = ["name": "Derek", "age": 28, "favMovie": "Zoolander"]
let brokenDictionary = ["name": "Steve", "age": 2]

let person = Person(dictionary: workingDictionary)
let person2 = Person(dictionary: brokenDictionary)
