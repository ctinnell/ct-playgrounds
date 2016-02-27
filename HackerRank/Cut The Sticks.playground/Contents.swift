var sticks = [5,4,4,2,2,8]
sticks = [1,2,3,4,3,3,2,1]

func cut(sticks: [Int]) -> [Int] {
    var updatedSticks = [Int]()
    print(sticks.filter({$0 > 0}).count)
    let minStick = sticks.filter({$0 > 0}).minElement()!
    for stick in sticks {
        updatedSticks.append(max(stick-minStick, 0))
    }
    return updatedSticks
}

while sticks.filter({$0 > 0}).count > 0 {
    sticks = cut(sticks)
}
