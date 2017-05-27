//
//  MVImagePickerViewController.swift
//  Quests
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 15/02/17.
//  Copyright © 2017 Mindvalley. All rights reserved.
//

import UIKit

class MVImagePickerView: UIView {

    // MARK:- Action create action sheet
    
    func createAndShowActionSheetToPickImage() {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: NSLocalizedString("Camera", comment: ""), style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .camera
                imagePicker.allowsEditing = true
                AppDelegate.current?.window?.rootViewController?.present(imagePicker, animated: true, completion: {
                });
            }
        }))
        alertController.addAction(UIAlertAction(title: NSLocalizedString("Photo Library", comment: ""), style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = true
                AppDelegate.current?.window?.rootViewController?.present(imagePicker, animated: true, completion: {
                });
            }
        }))
        alertController.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: { (action) in
            
        }))
        
        AppDelegate.current?.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }

}

// MARK:- UIImagePickerControllerDelegate

extension MVImagePickerView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
