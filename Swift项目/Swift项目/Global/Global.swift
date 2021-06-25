//
//  Global.swift
//  Swift项目
//
//  Created by 韩李涛 on 2021/6/24.
//

import UIKit
@_exported import SnapKit
@_exported import Kingfisher



public func ClassFromString(_ string:String) -> UIViewController?{
    // -1.获取命名空间
      guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
        print("没有获取到命名空间")
        return nil
      }
        let vcString =  nameSpace + "." + string
        
        //字符串转成anyClass
        guard let anyClass = NSClassFromString(vcString) else{
            return nil
        }
        
        //anyClass 转成 UIViewController.Type
        guard let childVcClass = anyClass as? UIViewController.Type else{
            return nil
        }
        //UIViewController.Type初始化一个UIViewContoller对象
        let vc = childVcClass.init()
         
         print(1)
         return vc
}

func testPrint<T>(_ msg:T,file:NSString = #file,line:Int = #line,fn:String = #function) {
  
    #if DEBUG
    let preffix = "\(file.lastPathComponent): \(line)_\(fn)"
    print(preffix,msg)
    #endif
  
}
//class BundleEx: Bundle {
//    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
//        if let bundle = Bundle.getLanguageBundel() {
//
//        return bundle.localizedString(forKey: key, value: value, table: tableName)
//
//        }else {
//
//        return super.localizedString(forKey: key, value: value, table: tableName)
//
//        }
//    }
//
//}
//extension Bundle {
//
//private static var onLanguageDispatchOnce: ()->Void = {
//
////替换Bundle.main为自定义的BundleEx
//
// object_setClass(Bundle.main, BundleEx.self)
//
//}
//
//
//    func onLanguage(){
//
//    Bundle.onLanguageDispatchOnce()
//
//    }
//
//    class func getLanguageBundel() -> Bundle? {
//
//    let languageBundlePath = Bundle.main.path(forResource: UserDefaults.standard[AppStatic.kCurrentLanguage] as? String, ofType: "lproj")
//
//    //        print("path = \(languageBundlePath)")
//
//    guard languageBundlePath != nil else {
//
//    return nil
//
//    }
//
//        let languageBundle = Bundle.init(path: languageBundlePath!)
//
//        guard languageBundle != nil else {
//
//        return nil
//
//        }
//
//        return languageBundle!
//
//        }
//
//        }
//
//
//
//    
