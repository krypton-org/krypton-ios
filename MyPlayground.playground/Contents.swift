protocol Bird {
    var name: String { get }
    var canFly: Bool { get }
}
protocol Flyable {
    var airspeedVelocity: Double { get }
}

extension Bird {
    var canFly: Bool { self is Flyable }
}


struct FlappyBird: Bird, Flyable {
    let name: String
    let flappyAmplitude: Double
    let flappyFrequency: Double
    
    var airspeedVelocity: Double {
        3 * flappyFrequency * flappyAmplitude
    }
}

struct Penguin: Bird {
    let name: String
}

struct SwiftBird: Bird, Flyable {
    var name: String { "Swift \(version)" }
    let version: Double
    private var speedFactor = 1000.0
    
    init(version: Double) {
        self.version = version
    }
    
    var airspeedVelocity: Double{
        version * speedFactor
    }
}
