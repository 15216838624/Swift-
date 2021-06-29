//
//  BaseService.swift
//  Swift项目
//
//  Created by 韩李涛 on 2021/6/25.
//

import UIKit
import Moya
import SwiftyJSON
class RequestAlertPlugin: PluginType {
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest { return request }
    func willSend(_ request: RequestType, target: TargetType) {
        if NetWork.needAlertPlugin == true {
            SVProgressHUD.show()
        }
    }
    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
            SVProgressHUD.dismiss()
    }
    func process(_ result: Result<Moya.Response, MoyaError>, target: TargetType) -> Result<Moya.Response, MoyaError> {
        return  result
    }
}


let provider = MoyaProvider<MultiTarget>(plugins:[RequestAlertPlugin()])
public extension TargetType{
    var baseURL: URL {
        return   URL(string:BaseUrlString)!
    }
    
    var headers: [String : String]? {
        
        return nil
    }
    

    var sampleData: Data {
        return "" .data(using: String.Encoding.utf8)!
    }
 
  
}
struct NetWork{
    static var needAlertPlugin:Bool = true
    var usersErroHandle:() -> ()?
    @discardableResult
  static  func SendRequest(_ target: MultiTarget,
                       callbackQueue: DispatchQueue? = .none,
                       progress: ProgressBlock? = .none,
                       requestFail:@escaping(MoyaError) ->Void = { _ in return },requestSuccess:@escaping(JSON) ->Void  = { _ in return }) -> Cancellable {
        return provider.request(target, callbackQueue: callbackQueue, progress: progress) { result in
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


