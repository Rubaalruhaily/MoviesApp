//
//  SignInUser.swift
//  MoviesApp
//
//  Created by roua alsahli on 29/08/1444 AH.
//

import UIKit

class SignInUser: UIViewController {
    
    var UserArray:[User]=[]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    func featchUsers(email:String,password:String)
    {
        
        print("test")
        let baseURL = "https://453cf8d4-476f-481e-9af7-ee231e062a1f.mock.pstmn.io"
        let UserURL = URL(string: baseURL+"/user")!
        
        let task = URLSession.shared.dataTask(with: UserURL) { data, response, error in
            if let data = data {
                if let Users = try? JSONDecoder().decode([User].self, from: data) {
                    self.UserArray = Users
                    print(Users)
                }else{
                    print("Invalid Response")
                }
                
            }else if let error = error {
                print("HTTP Request Faild \(error)")
            }
        }
        task.resume()
    }
    
}
