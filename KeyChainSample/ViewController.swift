import UIKit
import SwiftKeychainWrapper

class ViewController: UIViewController {
    
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let retrievedEmail: String = KeychainWrapper.standard.string(forKey: "userEmail")!
        let retrievedPassword: String? = KeychainWrapper.standard.string(forKey: "userPassword")
        AlertManager.showAlert(type: .custom(retrievedEmail), alertTittle: "KeyChain Saved Email", actionTitle: "Use Email") {
            self.EmailTF.text = retrievedEmail
            self.PasswordTF.text = retrievedPassword
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func loginBtn(_ sender: Any) {
        
        if let Email = EmailTF.text {
            let saveEmailSuccessful: Bool = KeychainWrapper.standard.set(Email, forKey: "userEmail")
            print("Save was successful: \(saveEmailSuccessful)")
            EmailTF.text = ""
        }

        if let password = PasswordTF.text {
            let savePasswordSuccessful: Bool = KeychainWrapper.standard.set(password, forKey: "userPassword")
            print("Save was successful: \(savePasswordSuccessful)")
            PasswordTF.text = ""
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let profileVC = storyboard.instantiateViewController(withIdentifier: "profileVC")
            self.navigationController?.pushViewController(profileVC, animated: true)
        }
    }
}
