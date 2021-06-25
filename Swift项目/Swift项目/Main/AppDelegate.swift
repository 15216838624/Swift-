

import UIKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        LangueManger.LangueSetUp()
   
        window = UIWindow(frame: ScreenBounds)
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        
        return true
    }



}

