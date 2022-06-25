//
//  FirestoreService.swift
//  HiFriends
//
//  Created by Anna Nosyk on 24/06/2022.
//

import Firebase
import FirebaseFirestore
import CoreText

class FirestoreService {
    
    static let shared = FirestoreService()
    //reference for database
    let db = Firestore.firestore()
    
    //reference for collection
    
    private var usersRef: CollectionReference {
        return db.collection("users")
        
    }
    
    // check register user or no
    
    func getUserData(user: User, completion: @escaping (Result<HiUsers, Error>) -> Void ){
        let doc = usersRef.document(user.uid)
        doc.getDocument { document, error in
            if let document = document, document.exists {
                guard let hiUser = HiUsers(document: document) else {
                    completion(.failure(UserError.cannotUnwrapToMUser))
                    return
                }
                completion(.success(hiUser))
            } else {
                completion(.failure(UserError.cannotGetUserInfo))
            }
        }
    }

    // for saving in collection
    func saveProfile(id: String, email: String, username: String?, avatarImageString: String?, description: String?, sex: String?, completion: @escaping (Result<HiUsers, Error>) -> Void) {
        
        guard Validators.isFilled(username: username, description: description, sex: sex) else { completion(.failure(UserError.notFilled))
            return
        }
        
        let user = HiUsers(username: username!, email: email, avatarStringURL : "not exist", description: description!, sex: sex!, id: id)
        
        self.usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
        
        
    }
    
}
