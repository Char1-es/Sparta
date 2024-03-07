class RemainderOperation {
    func calculateRemainder(lhs: Double, rhs: Double) -> Double {
        return lhs.truncatingRemainder(dividingBy: rhs)
    }
}
