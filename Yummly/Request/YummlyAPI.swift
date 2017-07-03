//
//  NewsAPI.swift
//  News
//
//  Created by Gu Jiajun on 2017/6/14.
//  Copyright © 2017年 gjj. All rights reserved.
//

import Foundation
import Moya
import Alamofire


enum YummlyAPI {
    case searchRecipes([String: Any])

}

let endpointClosure = { (target: YummlyAPI) -> Endpoint<YummlyAPI> in
    let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
    return defaultEndpoint.adding(newHTTPHeaderFields: ["X-Yummly-App-ID": ApplicationID,"X-Yummly-App-Key":ApplicationKey])
}

//let provider = MoyaProvider<YummlyAPI>(endpointClosure: endpointClosure)

extension YummlyAPI: TargetType {
    var baseURL: URL {
        return URL(string: BaseUrl)!
    }
    
    var path: String {
        switch self {
        case .searchRecipes(_):
            return SearchRecipesUrl
        
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .searchRecipes(let params):
            return params
        
        default:
            return ["_app_id":ApplicationID,"_app_key":ApplicationKey]
        }
    }

    
    var sampleData: Data {
        switch self {
        case .searchRecipes:
            return "{\"status\": \"ok\"}".data(using: String.Encoding.utf8)!
        }
    }
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public var validate: Bool {
        return false
    }
    
    var task: Task {
        return .request
    }
    
}



