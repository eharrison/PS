//
//  AlertViewController.swift
//  Quests
//
//  Created by Evandro Harrison Hoffmann on 4/24/17.
//  Copyright © 2017 Mindvalley. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIVisualEffectView!
    @IBOutlet weak var contentView: DesignableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var cancelButton: DesignableButton!
    @IBOutlet weak var okButton: DesignableButton!
    
    var okCallback: (()->Void)?
    var titleString: String?
    var message: String?
    var imageUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let titleString = titleString {
            titleLabel.text = titleString
        }
        if let message = message {
            instructionLabel.text = message
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        prepareForAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateIn()
    }
    
    // MARK: - Animations
    
    func prepareForAnimation(){
        contentView.isHidden = true
    }
    
    func animateIn(){
        contentView.animateShowPopingUp()
    }
    
    // MARK: - Events
    
    @IBAction func okButtonPressed(_ sender: Any) {
        okButton.animateTouchDown(halfWay: {
            self.contentView.animateFadeAway()
            self.dismiss(animated: true, completion: {
                self.okCallback?()
            })
        })
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        cancelButton.animateTouchDown(halfWay: {
            self.contentView.animateFadeAway()
            self.dismiss(animated: true, completion: {
                
            })
        })
    }
    
}

// MARK: - ViewController

extension UIViewController {
    
    func showEnableNotificationsRequest(_ callback: (()->Void)?){
        guard !didEnablePushNotifications else {
            callback?()
            return
        }
        
        let storyboard = UIStoryboard(name: "Alerts", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "AllowPushAlert") as! AlertViewController
        vc.okCallback = {
            MVNotificationsHelper.enableNotifications(withApplication: UIApplication.shared, callback: { (granted) in
                didEnablePushNotifications = true
                callback?()
            })
        }
        present(vc, animated: true, completion: nil)
    }
    
}
