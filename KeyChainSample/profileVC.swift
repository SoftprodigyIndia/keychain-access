//  profileVC.swift

import UIKit

class profileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func logoutBTn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}
