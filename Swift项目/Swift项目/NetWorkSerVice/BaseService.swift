//
//  BaseService.swift
//  Swift项目
//
//  Created by 韩李涛 on 2021/6/25.
//

import UIKit
import Moya
import SwiftyJSON
public extension TargetType{
    var baseURL: URL {
        return     URL(string:"https://www.jianshu.com/p/3b724005b3ef")!
    }
    
    var headers: [String : String]? {
        
        return nil
    }
    

    var sampleData: Data {
        return "" .data(using: String.Encoding.utf8)!
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default // Send parameters as JSON in request body
    }
  
}
struct MyError:Error {
    var message:String
}

extension MoyaProvider{
   @discardableResult
   open func SendRequest(_ target: Target,
                      callbackQueue: DispatchQueue? = .none,
                      progress: ProgressBlock? = .none,
                      requestFail:@escaping(MoyaError) ->Void = { _ in return },requestSuccess:@escaping(JSON) ->Void  = { _ in return }) -> Cancellable {
        return self.request(target, callbackQueue: callbackQueue, progress: progress) { result in
            switch result {
            case let .success(response):
                do {
                    let json =   try JSON(data: response.data)
                    requestSuccess(json)
                }catch{
                    let mapString = try! response.mapString()
                    testPrint("返回值不是json:\(mapString)")
                 }
                break
                case let .failure(error):
                 requestFail(error)
                 break;
             }
          }
        
    }
}
