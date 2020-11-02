import Foundation

let DEFAAULT_MIN_TIME_TO_LIVE = 30 * 1000 // 30 seconds

struct KryptonClient {
    var endpoint: String
    var minTimeToLive: Int
    func saveRefreshTokenClb() -> String? {return ""}
    
    init(endpoint: String, minTimeToLive: Int) {
        self.endpoint = endpoint
        self.minTimeToLive = minTimeToLive
    }
    
    func reinitialize() {
        //_init()
    }
    
    var _state.expiryDate: Date() {
        get {
            expiryDate
    }
    }
  
    
}
class _kryptonState {
    var token: String
    var expiryDate: Date?
    var user: [String: Any]?
    
    
    init(token: String) {
        self.token = token
        self.expiryDate = self.expiryDate ?? Date()
        self.user = self.user ?? Dictionary()
        
    }
}


