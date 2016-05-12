//: Playground - noun: a place where people can play

import UIKit

class Car {
    
    private let makeKey = "make"
    private let modelKey = "model"
    private let yearKey = "year"
    
    let make: String
    let model: String
    let year: Int
    
    var fullDescription: String {
        return "\(year) \(make) \(model)"
    }
    
    //var dictionaryRepresentation: Dictionary<String,AnyObject>
    
    var dictionaryRepresentation: [String: AnyObject] {
        
        let carDictionary: [String: AnyObject] = [makeKey: self.make, modelKey: self.model, yearKey: self.year]
        
        return carDictionary
    }
    
    init(make: String, model: String, year: Int) {
        self.make = make
        self.model = model
        self.year = year
    }
    
    //failable initializer, add ? to this init. Then check that values are there with guard let.
    init?(dictionary: [String: AnyObject]) {
        guard let make = dictionary[makeKey] as? String, let model = dictionary[modelKey] as? String, let year = dictionary[yearKey] as? Int else {
            return nil
        }
        self.make = make
        self.model = model
        self.year = year
    }
}

//Class to Dictionary

let myCar = Car(make: "Mazda", model: "3", year: 2007)
print(myCar.dictionaryRepresentation)

//Dictionary to Class

let dreamCarDictionary = ["makeKey": "Tesla", "modelKey": "Model S", "yearKey": 2025]
let dreamCar = Car(dictionary: dreamCarDictionary)

//Loop Car

let fancyCar = Car(make: "Mercedes", model: "C Class", year: 2016)
let fancyCarDictionary = fancyCar.dictionaryRepresentation
let secondFancyCar = Car(dictionary: fancyCarDictionary)
print(fancyCar.dictionaryRepresentation)
print(secondFancyCar?.dictionaryRepresentation)







