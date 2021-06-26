

import UIKit

class HTNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return self.topViewController?.supportedInterfaceOrientations ?? .portrait
    }
    override var shouldAutorotate: Bool{
        return self.topViewController?.shouldAutorotate ?? false
    }

}
