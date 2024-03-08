let calculator = Calculator(operation: AddOperation())

let addResult = calculator.calculate(lhs: 5.8, rhs: 2.4)
print(addResult)

calculator.changeOperator(operation: SubstractOperation())

let substractResult = calculator.calculate(lhs: 5.8, rhs: 2.4)
print(substractResult)

calculator.changeOperator(operation: RemainderOperation())

let remainderResult = calculator.calculate(lhs: 5.8, rhs: 2.4)
print(remainderResult)
