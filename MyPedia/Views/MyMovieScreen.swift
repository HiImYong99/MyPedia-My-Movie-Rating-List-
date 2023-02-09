//
//  MyMovieScreen.swift
//  MyPedia
//
//  Created by 김용태 on 2023/02/08.
//

import UIKit

class MyMovieScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var movieList = [String]()
    
    let table = UITableView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        layOut()
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(rightButtonClick))
        self.navigationItem.rightBarButtonItem = rightButton
        
        let explain = UIAlertController(title: "우측 상단 버튼을 눌러 관람한 영화를 추가해보세요‼️", message: "", preferredStyle: .alert)
        let yes = UIAlertAction(title: "OK", style: .cancel) { yes in
            
        }
        explain.addAction(yes)
        present(explain, animated: true)
        
        
    }
    
    @objc func rightButtonClick() {
        let alert = UIAlertController(title: "관람한 영화를 입력하세요", message: "", preferredStyle: .alert)
        
        alert.addTextField { inputText in
            inputText.placeholder = "영화제목을 입력하세요!"
            
        }
        
        let ok = UIAlertAction(title: "OK", style: .default) { (ok) in
            self.movieList.append((alert.textFields?[0].text)!)
            self.table.reloadData()
        }
        
        let cancel = UIAlertAction(title: "cancel", style: .cancel) { (cancel) in
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = movieList[indexPath.row]
        return cell
    }
    
    
    func layOut() {
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
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
