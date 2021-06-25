//
//  LangueManger.swift
//  Swift项目
//
//  Created by 韩李涛 on 2021/6/24.
//

import UIKit
class EXBundle: Bundle {
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        guard let bundle = self.getCurrentBundele() else{
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
        return bundle.localizedString(forKey: key, value: value, table: tableName)
    }
    private var bundleCode:[String:Bundle]?
    func getCurrentBundele() -> Bundle? {
        var bundle:Bundle?
        let currentLangue = UserDefaults.standard.object(forKey: currentLangueKey) as! String
        if  bundleCode?[currentLangue] != nil{
            return bundle
        }
        var path:String = ""
        if currentLangue == LangueEnum.chinese.rawValue {
            path =   Bundle.main.path(forResource:"zh-Hans.lproj", ofType: nil)!
            
        }else if currentLangue == LangueEnum.english.rawValue{
            path =  Bundle.main.path(forResource:"en.lproj", ofType: nil)!
        }
        bundle = Bundle.init(path: path)
        bundleCode?[currentLangue] = bundle
        return bundle
    }
}


extension Bundle {
    fileprivate static var onLanguageDispatchOnce: ()->Void = {
        object_setClass(Bundle.main, EXBundle.self)
    }
}

fileprivate let currentLangueKey = "currentLangue"

enum LangueEnum:String{
    case  chinese = "ch"
    case  english = "en"
}


class LangueManger: NSObject {
    static  func LangueSetUp(){
        if (UserDefaults.standard.object(forKey:currentLangueKey) as? String) == nil {
            let langue = NSLocale.preferredLanguages.first!
            UserDefaults.standard.setValue(langue, forKey: currentLangueKey)
        }
        Bundle.onLanguageDispatchOnce()
    }
    
    static   func switchToLangue(langue:LangueEnum)  {
        UserDefaults.standard.setValue(langue.rawValue, forKey: currentLangueKey)
    }
}
