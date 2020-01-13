import UIKit

// optionals

var str = "Hello, playground"

let imageUrl: String? = "Ola! Amigos!"

// if-let guard

if let profileUrl = imageUrl {
    print(profileUrl)
} else {
    print("Failed")
}

func validator() {
    let truth = false
    guard truth else {
        print("It was a lie")
        return
    }
}

func validator2() {
    let truth = false
    if !truth {
        print("It was a lie")
        return
    }
    
    
    //
}


validator()
validator2()
// closures

let simpleClosure = {
    print("Hello")
}

simpleClosure()

func closureFunc(wrapper: @autoclosure () -> ()) {
    print("Hello!")
    wrapper()
}

closureFunc (wrapper: print("Rachit"))

// struct vs class

class Human {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

let human = Human(name: "John")
print(human.name)

let human2 = human
human.name = "Cena"
print(human2.name)

struct OtherHuman {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var otherHuman = OtherHuman(name: "Bobby")
print(otherHuman.name)
let otherHuman2 = otherHuman

otherHuman.name = "Trap"
print(otherHuman.name)
print(otherHuman2.name)

// @autoclosure @escaping

class Runnable {
    var task: String?
    var action: () -> ()?
    
    init(task: String, action: @autoclosure @escaping () -> ()) {
        self.task = task
        self.action = action
    }
    
    func run() {
        action()
    }
}

let runner = Runnable(task: "Running", action: print("This is task"))
runner.run()

// protocol oriented programming

protocol Bird: CustomStringConvertible {
    var name: String { get }
    var canFly: Bool { get }
}

extension CustomStringConvertible where Self: Bird {
    var description: String {
        return canFly ? "I can fly" : "Guess I’ll just sit here :["
    }
}

protocol Flyable {
    var airSpeedVelocity: Double { get }
}

extension Bird {
    // Flyable birds can fly!
    var canFly: Bool { return self is Flyable }
}

struct FlappyBird: Bird, Flyable {
    let name: String
    let flappyAmplitude: Double
    let flappyFrequency: Double
    
    var airSpeedVelocity: Double {
        return 3 * flappyFrequency * flappyAmplitude
    }
}

struct Penguin: Bird {
    let name: String
}

struct SwiftBird: Bird, Flyable {
    var name: String { return "Swift \(version)" }
    let version: Double
    
    // Swift is FASTER every version!
    var airSpeedVelocity: Double { return version * 1000.0 }
}

enum UnladenSwallow: Bird, Flyable {
    case african
    case european
    case unknown
    
    var name: String {
        switch self {
        case .african:
            return "African"
        case .european:
            return "European"
        case .unknown:
            return "What do you mean? African or European?"
        }
    }
    
    var airSpeedVelocity: Double {
        switch self {
        case .african:
            return 10.0
        case .european:
            return 9.9
        case .unknown:
            fatalError("You are thrown from the bridge of death!")
        }
    }
}

extension UnladenSwallow {
    var canFly: Bool {
        return self != .unknown
    }
}

UnladenSwallow.african
UnladenSwallow.unknown.canFly
Penguin(name: "Kowalski")

class Motorcycle {
    init(name: String) {
        self.name = name
        speed = 200
    }
    var name: String
    var speed: Double
}

protocol Racer {
    var speed: Double { get }  // speed is the only thing racers care about
}

extension FlappyBird: Racer {
    var speed: Double {
        return airSpeedVelocity
    }
}

extension SwiftBird: Racer {
    var speed: Double {
        return airSpeedVelocity
    }
}

extension Penguin: Racer {
    var speed: Double {
        return 42  // full waddle speed
    }
}

extension UnladenSwallow: Racer {
    var speed: Double {
        return canFly ? airSpeedVelocity : 0
    }
}

extension Motorcycle: Racer {}

let racers: [Racer] =
    [UnladenSwallow.african,
     UnladenSwallow.european,
     UnladenSwallow.unknown,
     Penguin(name: "King Penguin"),
     SwiftBird(version: 3.0),
     FlappyBird(name: "Felipe", flappyAmplitude: 3.0, flappyFrequency: 20.0),
     Motorcycle(name: "Giacomo")
]

func topSpeed(of racers: [Racer]) -> Double {
    return racers.max(by: { $0.speed < $1.speed })?.speed ?? 0
}

topSpeed(of: racers)

// Using generics to pass arrays as well as arrayslices
func topSpeed<RacerType: Sequence>(of racers: RacerType) -> Double
    where RacerType.Iterator.Element == Racer {
        return racers.max(by: { $0.speed < $1.speed })?.speed ?? 0
}

topSpeed(of: racers[1...3])

extension Sequence where Iterator.Element == Racer {
    
    func topSpeed() -> Double {
        return self.max(by: { $0.speed < $1.speed })?.speed ?? 0
    }
}

racers.topSpeed()
racers[1...3].topSpeed()

// Equatable and comparable

protocol Score: Equatable, Comparable {
    var value: Int { get }
}

struct RacingScore: Score {
    let value: Int
    
    static func ==(lhs: RacingScore, rhs: RacingScore) -> Bool {
        return lhs.value == rhs.value
    }
    
    static func <(lhs: RacingScore, rhs: RacingScore) -> Bool {
        return lhs.value < rhs.value
    }
}

RacingScore(value: 150) >= RacingScore(value: 130)

func willCrash() -> Bool {
    fatalError()
    return true
}

let good = true

if good || willCrash() {
    print("made it")
}

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

numbers.map { (number) -> String in
   var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

enum Device {
    case iPhone
    case mac
    case iPad
    case Watch
    
    // enum function
    func introduced() -> String {
        switch self {
        case .iPhone:
            return "2007"
        default:
            return "2010"
        }
    }
    
    // enum property

    var year: String {
        switch self {
        case .iPhone:
            return "2007"
        default:
            return "2010"
        }
    }
    
    static func from(term: String) -> Device? {
        if term == "iWatch" {
            return .Watch
        }
        return nil
    }
}

print(Device.iPhone.year)

enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}

var overLight = TriStateSwitch.Low
overLight.next()

enum Direction: Int {
    case EAST = 1, WEST, NORTH, SOUTH
}

print(Direction(rawValue: 2))

enum Trade {
    case Buy(value: Int) // Associated values with enum
    case Sell(value: Int)
}

print(Trade.Buy(value: 200))

let trade = Trade.Buy(value: 200)
if case let Trade.Buy(stock) = trade {
    print("buy of \(stock)")
}

// enums and protocols

protocol AccountCompatible {
    var remainingFunds: Int { get }
    mutating func addFunds(amount: Int) throws
    mutating func removeFunds(amount: Int) throws
}

enum Account {
    case Empty
    case Funds(remaining: Int) // Associated values
    
    enum Error: Swift.Error {
        case Overdraft(amount: Int)
    }
    
    var remainingFunds: Int {
        switch self {
        case .Empty: return 0
        case .Funds(let remaining): return remaining
        }
    }
}

extension Account: AccountCompatible {
    
    mutating func addFunds(amount: Int) throws {
        var newAmount = amount
        if case let .Funds(remaining) = self {
            newAmount += remaining
        }
        if newAmount < 0 {
            throw Error.Overdraft(amount: -newAmount)
        } else if newAmount == 0 {
            self = .Empty
        } else {
            self = .Funds(remaining: newAmount)
        }
    }
    
    mutating func removeFunds(amount: Int) throws {
        try self.addFunds(amount: amount * -1)
    }
    
}


var account = Account.Funds(remaining: 20)
print("add: ", try? account.addFunds(amount:10))
print ("remove 1: ", try? account.removeFunds(amount:15))
print ("remove 2: ", try? account.removeFunds(amount:55))


enum A: Int { case i = 1, j, k, l
    
    

}


print(A.i.rawValue)
print(A.i.hashValue)
A(rawValue:2)


enum AA {
    case one, two, three, four
}

print(AA.one)


