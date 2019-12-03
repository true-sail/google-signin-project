//
//  ViewController.swift
//  GoogleSigninProject
//
//  Created by 家田真帆 on 2019/12/03.
//  Copyright © 2019 家田真帆. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
       
    }


}

extension ViewController: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        // errorがnilでない場合（エラーが存在する場合）
        if let error = error {
            // エラーを出力
            print(error.localizedDescription)
            
            // 処理を中断
            return
        }
        
        // 認証情報の取得
        guard let authentication = user.authentication else {
            // 認証情報が取れなければ、処理を中断
            return
        }
        
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
        accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { (result, error) in
            if let error = error {
                // エラーの場合
                print(error.localizedDescription)
                
            } else {
                // ログインできた場合
                print("ログイン成功")
                self.performSegue(withIdentifier: "toHome", sender: nil)
            }
        }
    }
    
}

