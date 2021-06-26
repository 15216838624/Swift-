//
//  MySerVice.swift
//  Swift项目
//
//  Created by 韩李涛 on 2021/6/25.
//

import UIKit
import Moya


 enum MyService {
    case zen
    case userProfile(String)
    case userRepositories(String)
}

extension MyService: TargetType {


    public var path: String {
        switch self {
        case .zen:
            return ""
        case .userProfile(let name):
            return "/2222"
        case .userRepositories(let name):
            return "/333/repos"
        }
    }
    public var method: Moya.Method {
        return .get
    }
    public var task: Task {
        switch self {
        case .userRepositories:
            return .requestParameters(parameters: ["sort": "pushed"], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    public var validationType: ValidationType {
        switch self {
        case .zen:
            return .successCodes
        default:
            return .none
        }
    }

    
}

public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

// MARK: - Response Handlers

class Test {
   static func test() {
    let provider = MoyaProvider<MyService>()

   provider.SendRequest(.zen, requestSuccess: { json in
    
    
    
//      let a = json["result"]["data"].array!
//       print(a)
//      
    })


  }

}
