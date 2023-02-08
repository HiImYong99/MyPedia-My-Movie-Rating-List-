//
//  RegisterScreen.swift
//  MyPedia
//
//  Created by 김용태 on 2023/02/08.
//

import UIKit

class RegisterScreen: UIViewController {
    
    
    var register = UILabel()
    var inputID = UITextField()
    var inputPW = UITextField()
    var registerBtn = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        
        textSetting(name: register, title: "회원가입", x: 120, y: 50, width: 200, height: 200, fontSize: 40.0, weight: .bold, color: .black)
        
        
        inputID.placeholder = "이메일을 입력하세요"
        inputID.backgroundColor = .gray
        inputID.frame = CGRect(x: 100, y: 280, width: 200, height: 30)
        view.addSubview(inputID)
        
        
        inputPW.placeholder = "비밀번호를 입력하세요"
        inputPW.isSecureTextEntry = true
        inputPW.backgroundColor = .gray
        inputPW.frame = CGRect(x: 100, y: 340, width: 200, height: 30)
        view.addSubview(inputPW)
        
        
        registerBtn.setTitle("회원가입", for: .normal)
        registerBtn.titleLabel?.font = .systemFont(ofSize: 30.0, weight: .bold)
        registerBtn.tintColor = .red
        registerBtn.backgroundColor = .green
        registerBtn.layer.cornerRadius = 35
        registerBtn.frame = CGRect(x: 120, y: 500, width: 150, height: 70)
        registerBtn.addTarget(self, action: #selector(registerToMovie), for: .touchUpInside)
        view.addSubview(registerBtn)
        
        
    }
    
    
    @objc func registerToMovie() {
        let email = inputID.text
        let password = inputPW.text
        Auth.auth().createUser(withEmail: email!, password: password!) {user, error in
            if error == nil {
                if let user = user {
                    print(email)
                    print(password)
                    self.navigationController?.pushViewController(MyMovieScreen(), animated: true)
                }
            } else {
                    print(error!)
            }
        }
        
    }
    
    func textSetting(name: UILabel, title: String,x: Int, y: Int, width: Int, height: Int, fontSize: Float, weight: UIFont.Weight, color: UIColor) {
        name.text = title
        name.frame = CGRect(x: x, y: y, width: width, height: height)
        name.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: weight)
        name.tintColor = color
        view.addSubview(name)
    }
    
    
    
}


//MARK: - PreView Setting

import SwiftUI
import FirebaseAuth

struct RegisterRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = RegisterScreen
    
    func makeUIViewController(context: Context) -> RegisterScreen {
        return RegisterScreen()
    }
    
    func updateUIViewController(_ uiViewController: RegisterScreen, context: Context) {
    }
}

@available(iOS 13.0.0, *)
struct RegisterPreview: PreviewProvider {
    static var previews: some View {
        RegisterRepresentable()
    }
}
