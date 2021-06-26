

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
