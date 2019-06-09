//
//  MatchAllQuery.swift
//  ElasticSwift
//
//  Created by Prafull Kumar Soni on 4/22/18.
//

import Foundation

// MARK:-  Match all Query

public class MatchAllQuery: Query {
    
    private static let BOOST = "boost"
    
    public let name: String = "match_all"
    
    var boost: Decimal?
    
    init() {}
    
    convenience init(withBuilder builder: MatchAllQueryBuilder) {
        self.init()
        self.boost = builder.boost
    }
    
    public func toDic() -> [String : Any] {
        var dic: [String: Any] = [:]
        if let boost = self.boost {
            dic[MatchAllQuery.BOOST] = boost
        }
        return [name : dic]
    }
}

// MARK:- Match None Query

public class MatchNoneQuery: Query {
    
    public let name: String = "match_none"
    
    init() {}
    
    convenience init(withBuilder builder: MatchNoneQueryBuilder) {
        self.init()
    }
    
    public func toDic() -> [String : Any] {
        return [self.name : [:]]
    }
}
