//
//  HomeViewController.swift
//  GoogleSigninProject
//
//  Created by 家田真帆 on 2019/12/03.
//  Copyright © 2019 家田真帆. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ログインユーザーの取得
        let user = Auth.auth().currentUser!
        
        emailLabel.text = user.email
        nameLabel.text = user.displayName
        
        // 画像の処理
        let data = try! Data(contentsOf: user.photoURL!)
        
        // データをもとにUIImageを作成
        let image = UIImage(data: data)
        
        imageView.image = image
      
    }
    

   

}
