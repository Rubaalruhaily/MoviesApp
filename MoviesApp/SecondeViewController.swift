//
//  SecondeViewController.swift
//  MoviesApp
//
//  Created by Ruba on 23/08/1444 AH.
//

import UIKit

class SecondeViewController: UIViewController, UITextFieldDelegate {
    
    var iconClick = false
    let imageicon = UIImageView()
    var UserArray:[User]=[]
    
    @IBOutlet weak var signInBackground: UIImageView!
    @IBOutlet weak var theLinear: UIImageView!
    @IBOutlet weak var firstTitle: UILabel!
    @IBOutlet weak var secondeTitle: UILabel!
    @IBOutlet weak var thirdTitle: UILabel!
    @IBOutlet weak var fourthTitle: UILabel!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var signinBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        featchUsers()
        email.attributedPlaceholder = NSAttributedString(string: "Enter your email", attributes:
        [NSAttributedString.Key.foregroundColor: UIColor(red: 0.35, green: 0.35, blue: 0.35, alpha: 1)])
        
        pass.attributedPlaceholder =
        NSAttributedString(string: "Enter your password", attributes:
        [NSAttributedString.Key.foregroundColor: UIColor(red: 0.35, green: 0.35, blue: 0.35, alpha: 1)])
        
        imageicon.image = UIImage(named: "closeeye")
        
        let contentView = UIView()
        contentView.addSubview(imageicon)
        
        contentView.frame =  CGRect(x: -10 , y: 0, width:24 ,height: 18)
        
        imageicon.frame = CGRect(x: -10 , y: 0, width:24 ,height: 18)
        
        pass.rightView = contentView
        pass.rightViewMode = .always
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageicon.isUserInteractionEnabled = true
        imageicon.addGestureRecognizer(tapGestureRecognizer)
        firstTitle.text = "Sign in"
        secondeTitle.text = "You'll find what you're looking for in the ocean of movies"
        thirdTitle.text = "Email"
        fourthTitle.text = "Password"
        
        email.delegate = self
        pass.delegate = self
        
        email.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingDidBegin)
        
        pass.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
        
      //  performSegue(withIdentifier: "goToHome", sender: nil)

    }
    
    @IBAction func SignInPressed(_ sender: Any) {
        
        
        let emailName = email.text
        let passName = pass.text
print(UserArray)
        email.resignFirstResponder()
        pass.resignFirstResponder()

        guard let email = email.text else { return }
        guard let pass = pass.text else { return }
            for i in UserArray {
                print(i)
                if i.email == email && i.password == pass {
                    print("succses")
                    signinBtn.layer.backgroundColor = UIColor(red: 0.953, green: 0.8, blue: 0.31, alpha: 1).cgColor
                    performSegue(withIdentifier: "goToHome", sender: nil)
                   
            }
        }
    }
    
    @objc func imageTapped(tapGestureRecognizer:UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if iconClick
        {
            iconClick=false
            tappedImage.image = UIImage(named: "openeye")
            pass.isSecureTextEntry = false
        }
        else
        {
            iconClick=true
            tappedImage.image = UIImage(named: "closeeye")
            pass.isSecureTextEntry = true
        }
    }
    
    //    @IBAction func SignInPressed(_ sender: UIButton) {
    //
    //    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == email {
            //            print(email.text!)
            textField.layer.cornerRadius = 8
            textField.layer.borderColor = UIColor(red: 0.953, green: 0.8, blue: 0.31, alpha: 1).cgColor
            textField.layer.borderWidth = 1
        }
        else
        {
            if textField == pass {
                textField.layer.cornerRadius = 8
                textField.layer.borderColor = UIColor(red: 0.953, green: 0.8, blue: 0.31, alpha: 1).cgColor
                textField.layer.borderWidth = 1
            }
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !(email.text?.isEmpty ?? true) && !(pass.text?.isEmpty ?? true) {
            self.signinBtn.layer.backgroundColor = UIColor(red: 0.953, green: 0.8, blue: 0.31, alpha: 1).cgColor
            self.signinBtn.setTitleColor(.black, for: .normal)
        }
       
        if textField == email {
            email.layer.borderColor = UIColor.clear.cgColor
            email.layer.borderWidth = 0
        } else {
            
        }
        
        if textField == pass {
            pass.layer.borderColor = UIColor.clear.cgColor
            pass.layer.borderWidth = 0
        } else {
            
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == email {
            pass.becomeFirstResponder()
        }else{
            
        }
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    func featchUsers()
    {
        let baseURL = "https://453cf8d4-476f-481e-9af7-ee231e062a1f.mock.pstmn.io"
        let UserURL = URL(string: baseURL+"/user")!
        
        let task = URLSession.shared.dataTask(with: UserURL) { data, response, error in
            if let data = data {
                
                if let Users = try? JSONDecoder().decode([User].self, from: data) {
                    self.UserArray = Users
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
