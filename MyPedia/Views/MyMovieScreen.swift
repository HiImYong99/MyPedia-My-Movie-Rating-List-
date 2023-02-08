//
//  MyMovieScreen.swift
//  MyPedia
//
//  Created by 김용태 on 2023/02/08.
//

import UIKit

class MyMovieScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let success = UILabel()
        textSetting(name: success, title: "로그인 성공", x: 90, y: 100, width: 300, height: 300, fontSize: 50, weight: .bold, color: .black)
        
        func textSetting(name: UILabel, title: String,x: Int, y: Int, width: Int, height: Int, fontSize: Float, weight: UIFont.Weight, color: UIColor) {
            name.text = title
            name.frame = CGRect(x: x, y: y, width: width, height: height)
            name.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: weight)
            name.tintColor = color
            view.addSubview(name)
        }
    
    }
}



//MARK: - PreView Setting

import SwiftUI

struct MovieRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = MyMovieScreen
    
    func makeUIViewController(context: Context) -> MyMovieScreen {
        return MyMovieScreen()
    }
    
    func updateUIViewController(_ uiViewController: MyMovieScreen, context: Context) {
    }
}

@available(iOS 13.0.0, *)
struct MoviePreview: PreviewProvider {
    static var previews: some View {
        MovieRepresentable()
    }
}
