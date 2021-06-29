//
//  MySerVice.swift
//  Swift项目
//
//  Created by 韩李涛 on 2021/6/25.
//

import UIKit
import Moya


 enum MyService {
    case logoin
    case userInfFo(query: String)
    case userAutority(String)
}

extension MyService: TargetType {


    public var path: String {
        switch self {
        case .logoin:
            return ""
        case .userInfFo(_):
            return ""
        case .userAutority(_):
            return ""
        }
    }
    public var method: Moya.Method {
        return .get
    }
    public var task: Task {
        let parmeters: [String : Any] = [:]
        switch self {
        case .logoin:
            return .requestPlain
        default:
            return  .requestParameters(parameters: parmeters, encoding: JSONEncoding.default)
        }
    }
    public var validationType: ValidationType {
        switch self {
        case .logoin:
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

class MyApi {
    static func login( compete:@escaping([Any]) -> ()) {
    NetWork.SendRequest(MultiTarget(MyService.logoin), callbackQueue: nil, progress: nil, requestFail: { error in
        
    }, requestSuccess: {json in
        
      let array =  json["result"]["data"].arrayObject!
        
       compete(array)
    
     }
      )
   }
    static func getUsersInfo(name:String){
        NetWork.SendRequest(MultiTarget(MyService.userInfFo(query: "hhh")), callbackQueue: nil, progress: nil, requestFail: { error in
            
        }, requestSuccess: {json in
            print(json)
      }
    )
}
    
    
    

    
   
}
