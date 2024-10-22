//
//  ViewController.swift
//  PersistanceNotesGruper
//
//  Created by MICHAEL GRUPER on 10/16/24.
//

import UIKit

public class Dog: Codable{
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


class ViewController: UIViewController {
    @IBOutlet weak var hSOutlet: UITextField!
    @IBOutlet weak var nameOutlet: UITextField!
    //class called userdefaults with static var called standard, creates object of user defaults class
    //gives us access to storage on the phone
    var defaults = UserDefaults.standard
    
    var dogs = [Dog]()
    
    var encoder = JSONEncoder()
    var decoder = JSONDecoder()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //defaults.set(150, forKey: "highScore")
        
       var hs = defaults.integer(forKey: "highScore")
        print(hs)
        //print(defaults)
        
        dogs.append(Dog(name: "Bowser", age: 12))
        dogs.append(Dog(name: "Waldo", age: 10))
        
        //getting custom array from the phone
        if let blahDogs = defaults.data(forKey: "theDogs"){
            
            if let inDogs = try? decoder.decode([Dog].self, from: blahDogs){
                dogs = inDogs
                for d in dogs{
                    print(d.name)
                }
            }
        }
        
        
        //encoding the objects to save to the phone
        if let dooogs = try? encoder.encode(dogs){
            defaults.set(dooogs, forKey: "theDogs")
        }
    }

    @IBAction func saveButtonAction(_ sender: UIButton) {
        var blah = Int(hSOutlet.text!)
        defaults.set(blah, forKey: "highScore")
        var name = nameOutlet.text!
        defaults.set(name, forKey:"name")
        var n = defaults.string(forKey: "name")
        print(n)
    }
    
    
}

