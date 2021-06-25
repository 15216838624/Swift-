//
//  BaseService.swift
//  Swift项目
//
//  Created by 韩李涛 on 2021/6/25.
//

import UIKit
import Moya

public extension TargetType{
    var baseURL: URL {
        return  URL(string:"https://www.jianshu.com/p/d3de8911fa3e")!
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

extension Moya.Response {
    func mapNSArray() throws -> NSArray {
        let any = try self.mapJSON()
        guard let array = any as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
}


extension MoyaProvider{
   @discardableResult
   open func sendRequest(_ target: Target,
                      callbackQueue: DispatchQueue? = .none,
                      progress: ProgressBlock? = .none,
                      requestFail:@escaping(MoyaError) ->Void = { _ in return },requestSuccess:@escaping(Any) ->Void  = { _ in return }) -> Cancellable{
        return self.request(target, callbackQueue: callbackQueue, progress: progress) { result in
            switch result {
            case let .success(response):
               if let obj = try? response.mapJSON() {
                   requestSuccess(obj)
               }else{
                   requestSuccess(response)
               }
            break
            case let .failure(error):
             requestFail(error)
             break;
          }
        }
    }
     
}
