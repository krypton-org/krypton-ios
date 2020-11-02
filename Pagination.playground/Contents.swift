
class PageInfo {
    var currentPage:Int!
    var perPage:Int?
    var pageCount:Int?
    var itemCount:Int?
    var hasNextPage:Bool?
    var hasPreviousPage:Bool?

    init(json:Dictionary<String, Any>){
        currentPage = (json["currentPage"] as! Int)
        perPage = json["perpage"] as? Int
        pageCount = json["pageCount"] as? Int
        itemCount = json["itemCount"] as? Int
        hasNextPage = json["hasNextPage"] as? Bool
        hasPreviousPage = json["hasPreviousPage"] as? Bool
    }
}
class Pagination {
    var items: Array<Dictionary<String, Any>>
    var pageInfo: PageInfo

    init(json: Dictionary<String, Any>){
        items = (json["items"] as? Array<Dictionary<String, Any>>)!
        pageInfo = PageInfo(json: json["pageInfo"] as! Dictionary<String, Any>)
    }
}


