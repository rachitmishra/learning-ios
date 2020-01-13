import UIKit

class Human {
    var passport: Passport?
    let name: String
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("I'm gone, friends")
    }
}

class Passport {
    var human: Human?
    let citizenship: String
    init(citizenship: String) {
        self.citizenship = citizenship
        print("You've made a passport object")
    }
    deinit {
        print("I, paper, am gone")
    }
}


var passport: Passport? = Passport(citizenship: "Republic of India")
passport?.human = nil
passport = nil
