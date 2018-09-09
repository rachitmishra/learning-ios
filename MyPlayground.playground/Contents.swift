import UIKit

var str = "Hello, playground"

let f = { (x: Int) -> Int in return 42+42}
f(20)

let closures = [f,
                {(x: Int) -> Int in x * 2},
                {x in return x*2},
                {x in x*2},
                {$0 * 2}
]

for f in closures {
    f(2)
}

let f2 = {(x: Float, y: Float) -> Float in x + y}

f2(1.0, 2.0)

let deepThought = {
    (question: String) in return "Answer to \(question) is \(7*6)"
}

deepThought("How old are you?")
