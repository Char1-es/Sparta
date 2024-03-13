var attemptRecord: [Int] = []

func generateRandomNumbers() -> [Int] {
    var randomNumbers: Set<Int> = []
    
    while randomNumbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        
        randomNumbers.update(with: randomNumber)
    }
    
    return Array(randomNumbers)
}

func inputGameNumbers() -> [Int] {
    var userNumbers = [Int]()
    
    while userNumbers.count != 3 {
        print("숫자를 입력하세요")
        
        guard let userInputNumbers = readLine()?.split(separator: "") else { continue }
        
        if checkValidNumbers(for: userInputNumbers) {
            userNumbers = userInputNumbers.compactMap { Int($0) }
        } else {
            print("올바르지 않은 입력값입니다", terminator: "\n\n")
        }
    }
    
    return userNumbers
}

func checkValidNumbers(for numbers: [Substring]) -> Bool {
    guard Set(numbers).count == 3 else { return false }
    
    for number in numbers {
        guard let number = Int(number) else { return false }
    }
    
    return true
}

func countStrike(userNumbers: [Int], randomNumbers: [Int]) -> Int {
    var strikeCount = 0
    
    for index in 0...2 {
        if userNumbers[index] == randomNumbers[index] {
            strikeCount += 1
        }
    }
    
    return strikeCount
}

func countBall(userNumbers: [Int], randomNumbers: [Int]) -> Int {
    var ballCount = 0
    
    for index in 0...2 {
        if userNumbers.contains(randomNumbers[index]), userNumbers[index] != Array(randomNumbers)[index] {
            ballCount += 1
        }
    }
    
    return ballCount
}

func playGame() {
    print("< 게임을 시작합니다 >")
    
    let randomNumbers = generateRandomNumbers()
    print("컴퓨터 수: \(randomNumbers)")
    
    var attempCount = 0
    
    while true {
        let userNumbers = inputGameNumbers()
        let strikeCount = countStrike(userNumbers: userNumbers, randomNumbers: randomNumbers)
        let ballCount = countBall(userNumbers: userNumbers, randomNumbers: randomNumbers)
        
        if strikeCount == 3 {
            print("정답입니다!", terminator: "\n\n")
            attempCount += 1
            updateRecord(with: attempCount)
            break
        } else if strikeCount > 0 || ballCount > 0 {
            print("\(strikeCount)스트라이크 \(ballCount)볼", terminator: "\n\n")
            attempCount += 1
        } else {
            print("Nothing", terminator: "\n\n")
            attempCount += 1
        }
    }
}

func updateRecord(with count: Int) {
    attemptRecord.append(count)
}

func showRecord() {
    for (game, attemp) in attemptRecord.enumerated() {
        print("\(game + 1)번째 게임 : 시도 횟수 - \(attemp)")
    }
}

func showInformation() {
    var isRunning = true
    
    while isRunning {
        print("""
        환영합니다! 원하시는 번호를 입력해주세요
        1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기
        """)
        
        switch readLine() {
        case "1":
            playGame()
        case "2":
            showRecord()
        case "3":
            isRunning = false
            print("< 숫자 야구 게임을 종료합니다 >")
            break
        default:
            print("올바른 숫자를 입력해주세요!", terminator: "\n\n")
        }
    }
}

showInformation()

