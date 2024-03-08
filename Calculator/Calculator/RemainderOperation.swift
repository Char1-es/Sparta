class RemainderOperation: AbstractOperation { 
    override func calculate(lhs: Double, rhs: Double) -> Double {
        return lhs.truncatingRemainder(dividingBy: rhs)
    }
}
