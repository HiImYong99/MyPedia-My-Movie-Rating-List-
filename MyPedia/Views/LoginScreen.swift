//
//  LoginScreen.swift
//  MyPedia
//
//  Created by 김용태 on 2023/02/08.
//

import UIKit

class LoginScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let register = UILabel()
        textSetting(name: register, title: "로그인", x: 145, y: 50, width: 200, height: 200, fontSize: 40.0, weight: .bold, color: .black)
        
        let inputID = UITextField()
        inputID.placeholder = "이메일을 입력하세요"
        inputID.backgroundColor = .gray
        inputID.frame = CGRect(x: 100, y: 280, width: 200, height: 30)
        view.addSubview(inputID)
        
        let inputPW = UITextField()
        inputPW.placeholder = "비밀번호를 입력하세요"
        inputPW.backgroundColor = .gray
        inputPW.frame = CGRect(x: 100, y: 340, width: 200, height: 30)
        view.addSubview(inputPW)

        let registerBtn = UIButton(type: .system)
        registerBtn.setTitle("로그인", for: .normal)
        registerBtn.titleLabel?.font = .systemFont(ofSize: 30.0, weight: .bold)
        registerBtn.tintColor = .red
        registerBtn.backgroundColor = .yellow
        registerBtn.layer.cornerRadius = 35
        registerBtn.frame = CGRect(x: 120, y: 500, width: 150, height: 70)
        view.addSubview(registerBtn)
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

struct LoginRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = LoginScreen

    func makeUIViewController(context: Context) -> LoginScreen {
        return LoginScreen()
    }

    func updateUIViewController(_ uiViewController: LoginScreen, context: Context) {
    }
}

@available(iOS 13.0.0, *)
struct LoginPreview: PreviewProvider {
    static var previews: some View {
        LoginRepresentable()
    }
}
