//
//  RegistrationViewModel.swift
//  InstgramCloneFirebase
//
//  Created by 陳郁勳 on 2022/1/19.
//
import Firebase
import UIKit

protocol RegistrationObserver: AnyObject {

}

class RegistrationViewModel {
    //MARK: - Observer
    weak var observer: RegistrationObserver?
    
    //MARK: - initial
    init() {}
    
    //MARK: - Properties
    
    //MARK: - Function
    func checkSignupResult(result: AuthDataResult?, createUserError: Error?, userName: String, image: UIImage) {
        // Error handling.
        if let createUserError = createUserError {
            print("Fail to create user: ", createUserError)
            return
        }
        
        self.uploadImageToStorage(image: image) { storageImage in // Upload image to Storage Successful.
            self.queryImageUrl(image: storageImage) { imageUrl in // Query image url Successful.
                self.uploadUserInfoToFirebaseRealTime(authDataResult: result, userName: userName, url: imageUrl)
            }
        }
    }
    
    private func uploadImageToStorage(image: UIImage, completion: @escaping (StorageReference) -> Void) {
        let fileName = NSUUID().uuidString // FireBase storage random key.
        guard let uploadImage = image.jpegData(compressionQuality: 0.3) else { return } // Compression image to JPEG.
        let storageImage = Storage.storage().reference().child("profileImage").child(fileName) // Firebase storage path.
        
        storageImage.putData(uploadImage, metadata: nil) { metaData, uploadError in // Excute upload image to firebase storage.
            if let uploadError = uploadError {
                print("Fail to upload image to firebase storage: ", uploadError)
                return
            }
            completion(storageImage) // upload Success.
        }
    }
    
    private func queryImageUrl(image: StorageReference, completion: @escaping (String) -> Void) {
        // Error handling.
        image.downloadURL { url, queryImageError in
            if let queryImageError = queryImageError {
                print("Fail to query image url: ", queryImageError)
                return
            }
            
            guard let profileImageUrl = url?.absoluteString else { return }
            completion(profileImageUrl) // Return image url.
        }
    }
    
    private func uploadUserInfoToFirebaseRealTime(authDataResult: AuthDataResult?, userName: String, url: String) {
        guard let uid: String = authDataResult?.user.uid else { return } // User identifier.
        let dictionaryValues: [String: String] = ["userName": userName, "profileImage": url] // Firebase real time body.
        let updateValues: [String: [String:String]] = [uid: dictionaryValues] // Update real time data.
        
        Database.database().reference().child("users").updateChildValues(updateValues) { err, ref in
            if let err = err {
                print("Failed to save user info into db:", err)
                return
            }
            
            // Upload user info successful.
        }
    }
}
