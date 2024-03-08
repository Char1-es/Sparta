class Calculator {
    private var operation = AbstractOperation()
    
    init(operation: AbstractOperation) {
        self.operation = operation
    }
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        operation.calculate(lhs: lhs, rhs: rhs)
    }
    
    func changeOperator(operation: AbstractOperation) {
        self.operation = operation
    }
}
