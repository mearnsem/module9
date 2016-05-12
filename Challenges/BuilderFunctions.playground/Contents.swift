//: Playground - noun: a place where people can play

import UIKit

class Car {
    
    private let makeKey = "make"
    private let modelKey = "model"
    private let yearKey = "year"
    private let colorKey = "color"
    private let numberOfDoorsKey = "numberOfDoors"
    
    let make: String
    let model: String
    let year: Int
    let color: String
    let numberOfDoors: Int
    
    var fullDescription: String {
        return "\(year) \(make) \(model) \(color) \(numberOfDoors)"
    }
    
    //var dictionaryRepresentation: Dictionary<String,AnyObject>
    
    var dictionaryRepresentation: [String: AnyObject] {
        
        let carDictionary: [String: AnyObject] = [makeKey: self.make, modelKey: self.model, yearKey: self.year, colorKey: self.color, numberOfDoorsKey: self.numberOfDoors]
        
        return carDictionary
    }
    
    init(make: String, model: String, year: Int, color: String, numberOfDoors: Int) {
        self.make = make
        self.model = model
        self.year = year
        self.color = color
        self.numberOfDoors = numberOfDoors
    }
    
    //failable initializer, add ? to this init. Then check that values are there with guard let.
    init?(dictionary: [String: AnyObject]) {
        guard let make = dictionary[makeKey] as? String, let model = dictionary[modelKey] as? String, let year = dictionary[yearKey] as? Int, let color = dictionary[colorKey] as? String, let numberOfDoors = dictionary[numberOfDoorsKey] as? Int else {
            return nil
        }
        self.make = make
        self.model = model
        self.year = year
        self.color = color
        self.numberOfDoors = numberOfDoors
    }
}

//Class to Dictionary

let myCar = Car(make: "Mazda", model: "3", year: 2007, color: "Red", numberOfDoors: 4)
print(myCar.dictionaryRepresentation)

//Dictionary to Class

let dreamCarDictionary = ["makeKey": "Tesla", "modelKey": "Model S", "yearKey": 2025, "colorKey": "Black"]
let dreamCar = Car(dictionary: dreamCarDictionary)

//Loop Car

let fancyCar = Car(make: "Mercedes", model: "C Class", year: 2016, color: "White", numberOfDoors: 2)
let fancyCarDictionary = fancyCar.dictionaryRepresentation
let secondFancyCar = Car(dictionary: fancyCarDictionary)
print(fancyCar.dictionaryRepresentation)
print(secondFancyCar?.dictionaryRepresentation)







