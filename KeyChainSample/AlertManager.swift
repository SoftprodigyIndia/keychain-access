//  AlertManager.swift

import UIKit

enum Prompt {
    
    case networkUnavailable
    case serverNotResponding
    case custom(String)
    
    var message: String? {
        
        switch self {
        case .networkUnavailable:
            return "noInternet"
        case .serverNotResponding:
            return "SomethingWrong"
        case .custom(let message):
            return message
        }
    }
}

class AlertManager {
    
    typealias actionHandler = ()->()
    
    static func showAlert(type: Prompt) {
        
        let alert = UIAlertController.init(title: nil, message: type.message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {Void in})
        alert.addAction(action)
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
        guard let controller = delegate.window?.rootViewController else { return }
        
        controller.present(alert, animated: true, completion: nil)
    }
    
    static func showAlert(type:Prompt, action:@escaping actionHandler){
        
        let alert = UIAlertController.init(title: nil, message: type.message, preferredStyle: .alert)
        let action = UIAlertAction.init(title: "OK", style: .default) { (_) in
            action()
        }
        alert.addAction(action)
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
        guard let controller = delegate.window?.rootViewController else { return }
        
        controller.present(alert, animated: true, completion: nil)
    }
    
    static func showAlert(type:Prompt,alertTittle : String, actionTitle: String, action:@escaping actionHandler){
        
        let alert = UIAlertController.init(title: alertTittle, message: type.message, preferredStyle: .alert)
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
        let action = UIAlertAction.init(title: actionTitle, style: .default) { (_) in
            action()
        }
        alert.addAction(action)
        alert.addAction(cancelAction)
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
        guard let controller = delegate.window?.rootViewController else { return }
        
        controller.present(alert, animated: true, completion: nil)
    }
}
