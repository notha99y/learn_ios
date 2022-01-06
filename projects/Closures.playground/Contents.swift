func calculator (n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

func add (n1: Int, n2: Int) -> Int {
    return n1 + n2
}


calculator(n1: 2, n2: 3, operation: add) // Normal way
calculator(n1: 2, n2: 3, operation: { (n1, n2) in n1 * n2 }) // Closure
calculator(n1: 2, n2: 3, operation: { $0 * $1 }) // Shorter Closure
calculator(n1: 2, n2: 3) {$0 * $1} // Trailing Closure


let array = [6,2,3,9,4,1]

func addOne (n1: Int) -> Int {
    return n1 + 1
}

array.map(addOne) // Normal way
array.map{$0 + 1} // Trailing Closure
