//
//  ViewController.swift
//  MyPedia
//
//  Created by 김용태 on 2023/02/08.
//

import UIKit

class MainScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let mainTitle = UILabel()
        mainTitle.text = "마이피디아"
        mainTitle.frame = CGRect(x: 89, y: 150, width: 300, height: 100)
        mainTitle.font = UIFont.systemFont(ofSize: 50.0, weight: .bold)
        view.addSubview(mainTitle)
        
        let titleImage = UIImageView()
        titleImage.image = UIImage(systemName: "book.fill")
        titleImage.tintColor = .black
        titleImage.frame = CGRect(x: 50, y: 280, width: 300, height: 100)
        view.addSubview(titleImage)
        
        let registerBtn = UIButton(type: .system)
        registerBtn.setTitle("회원가입", for: .normal)
        registerBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
        registerBtn.tintColor = .red
        registerBtn.backgroundColor = .green
        registerBtn.layer.cornerRadius = 25
        registerBtn.frame = CGRect(x: 93, y: 450, width: 200, height: 50)
        view.addSubview(registerBtn)
        
        let loginBtn = UIButton(type: .system)
        loginBtn.setTitle("로그인", for: .normal)
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
        loginBtn.tintColor = .red
        loginBtn.backgroundColor = .yellow
        loginBtn.layer.cornerRadius = 25
        loginBtn.frame = CGRect(x: 93, y: 520, width: 200, height: 50)
        view.addSubview(loginBtn)
    }


}








//MARK: - PreView Setting

import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = MainScreen

    func makeUIViewController(context: Context) -> MainScreen {
        return MainScreen()
    }

    func updateUIViewController(_ uiViewController: MainScreen, context: Context) {
    }
}

@available(iOS 13.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}
