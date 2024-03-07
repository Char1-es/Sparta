class Calculator {
    private let addOperation = AddOperation()
    private let substractOperation = SubstractOperation()
    private let multiplyOperation = MultiplyOperation()
    private let divideOperation = DivideOperation()
    private let remainderOperation = RemainderOperation()
    
    func calculate(operator: String, lhs: Double, rhs: Double) -> Double {
        switch `operator` {
        case "+":
            return addOperation.add(lhs: lhs, rhs: rhs)
        case "-":
            return substractOperation.subtract(lhs: lhs, rhs: rhs)
        case "/":
            return divideOperation.divide(lhs: lhs, rhs: rhs)
        case "*":
            return multiplyOperation.multiply(lhs: lhs, rhs: rhs)
        case "%":
            return remainderOperation.calculateRemainder(lhs: lhs, rhs: rhs)
        default:
            return 0
        }
    }
}
