enum VehicleType: Int {
    case Bike = 1
    case Car = 2
    case Truck = 3
}

let segmentWidths = [2,3,1,2,3,2,3,3]
let segments = [[0,3],[4,6],[6,7],[3,5],[0,7],[2,3],[6,6],[1,1],[0,0]]

for segment in segments {
    let start = segment[0]
    let end = segment[1]
    let minSegmentSize = segmentWidths[start...end].minElement()!
    let vehicleType = VehicleType(rawValue: minSegmentSize)!
    print(vehicleType," - ",vehicleType.rawValue)
}