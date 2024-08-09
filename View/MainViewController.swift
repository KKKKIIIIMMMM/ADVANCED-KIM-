//
//  MainViewController.swift
//  ADVANCED"KIM"
//
//  Created by 김동준 on 8/9/24.
//

import UIKit

class MainViewController: UIViewController {
    
    let searchTextField = UITextField(frame: CGRect(x: 20, y: 80, width:300, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 검색창
        let searchTextField = UITextField(frame: CGRect(x: 20, y: 80, width:360, height: 40))
        // placeholder 자리 표시자
        searchTextField.placeholder = "sayno"
        searchTextField.layer.cornerRadius = 20
        // borderWidth 테두리 두께
        searchTextField.layer.borderWidth = 3
        searchTextField.layer.borderColor = UIColor.orange.cgColor
        searchTextField.textAlignment = .left
        searchTextField.text = "sayno"
        
        // 왼쪽 패딩 추가
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: searchTextField.frame.height))
        searchTextField.leftView = paddingView
        searchTextField.leftViewMode = .always
        
        // 돋보기 아이콘 추가
        let searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        searchIcon.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        let searchIconView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        searchIconView.addSubview(searchIcon)
        searchTextField.rightView = searchIconView
        // 오른쪽 오버레이 보기가 텍스트 필드에 나타날 떄를 제어하는 모드.
        searchTextField.rightViewMode = .always
        
        // 돋보기 아이콘에 제스처 인식기 추가
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(searchIconTapped))
        searchIconView.isUserInteractionEnabled = true
        searchIconView.addGestureRecognizer(tapGesture)
        
        // 최근 본 책 라벨
        let recentBooksbutton = UIButton(frame: CGRect(x: -30, y: 140, width: 200, height: 30))
        recentBooksbutton.setTitle("최근 본 책", for: .normal)
        recentBooksbutton.setTitleColor(.blue, for: .normal)
        recentBooksbutton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        recentBooksbutton.addTarget(self, action: #selector(presentSecondViewController), for: .touchUpInside)
        
//        recentBooksLabel.text = "최근 본 책"
//        recentBooksLabel.textColor = .black
//        recentBooksLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
//        let Searchresultsbutton = UIButton(frame: CGRect(x: 30, y: 300, width: 280, height: 30))
//        Searchresultsbutton.setTitle("세이노의 가르침    세이노    14,000원", for: .normal)
//        Searchresultsbutton.setTitleColor(.gray, for: .normal)
        
        
        // 컬러 뷰 (책 표지)
        let colors: [UIColor] = [.green, .yellow, .orange, .red]
        //        let colors: [UIColor] = [.red, .orange, .yellow, .green]
        for i in 0..<colors.count {
            let colorView = UIView(frame: CGRect(x: 20 + (100 * i), y: 180, width: 50, height: 50))
            colorView.backgroundColor = colors[i]
            colorView.layer.cornerRadius = 25
            colorView.layer.borderWidth = 1
            colorView.layer.borderColor = UIColor.black.cgColor
            self.view.addSubview(colorView)
        }
        
        // 검색 결과 라벨
        let searchResultsLabel = UILabel(frame: CGRect(x: 20, y: 250, width: 200, height: 30))
        searchResultsLabel.text = "검색 결과"
        searchResultsLabel.textColor = .blue
        searchResultsLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        // 검색 결과 박스
        let resultBox1 = UIView(frame: CGRect(x: 20, y: 290, width: 365, height: 50))
        // borderWidth 테두리 두께
        resultBox1.layer.borderWidth = 3
        resultBox1.layer.borderColor = UIColor.orange.cgColor
        
        let resultBox2 = UIView(frame: CGRect(x: 20, y: 350, width: 365, height: 50))
        // borderWidth 테두리 두께
        resultBox2.layer.borderWidth = 3
        resultBox2.layer.borderColor = UIColor.orange.cgColor
        
        let resultBox3 = UIView(frame: CGRect(x: 20, y: 410, width: 365, height: 50))
        // borderWidth 테두리 두께
        resultBox3.layer.borderWidth = 3
        resultBox3.layer.borderColor = UIColor.orange.cgColor
        
        // 검색 결과 텍스트 추가
        let Searchresultsbutton = UIButton(frame: CGRect(x: -80, y: 300, width: 280, height: 30))
        Searchresultsbutton.setTitle("책목록", for: .normal)
        Searchresultsbutton.setTitleColor(.black, for: .normal)
        Searchresultsbutton.addTarget(self, action: #selector(presentFourthViewController) , for: .touchUpInside)
        
        // 검색 탭 버튼
        let searchTabButton = UIButton(frame: CGRect(x: 20, y: 770, width: 180, height: 50))
        searchTabButton.setTitle("검색 탭", for: .normal)
        //      searchTabButton.addTarget(self, action: #selector(presentSecondViewController), for: .touchUpInside)
        searchTabButton.setTitleColor(.black, for: .normal)
        // borderWidth 테두리 두께
        searchTabButton.layer.borderWidth = 3
        searchTabButton.layer.borderColor = UIColor.orange.cgColor
        
        //      searchTabButton.translatesAutoresizingMaskIntoConstraints = false
        //      present(BookDetailViewController, animated: )
        
        // 담은 책 리스트 탭 버튼
        let savedBooksTabButton = UIButton(frame: CGRect(x: 203, y: 770, width: 180, height: 50))
        savedBooksTabButton.setTitle("담은 책 리스트 탭", for: .normal)
        savedBooksTabButton.setTitleColor(.black, for: .normal)
        savedBooksTabButton.addTarget(self, action: #selector(presentThirdViewController) , for: .touchUpInside)
        
        // borderWidth 테두리 두께
        savedBooksTabButton.layer.borderWidth = 3
        savedBooksTabButton.layer.borderColor = UIColor.orange.cgColor
        
        // 뷰에 추가
        self.view.addSubview(searchTextField)
        self.view.addSubview(recentBooksbutton)
        self.view.addSubview(searchResultsLabel)
        self.view.addSubview(resultBox1)
        self.view.addSubview(resultBox2)
        self.view.addSubview(resultBox3)
        self.view.addSubview(searchTabButton)
        self.view.addSubview(savedBooksTabButton)
        self.view.addSubview(Searchresultsbutton)
        
    }
    @objc func presentSecondViewController() {
        let secondViewController = SecondViewController()
        secondViewController.modalPresentationStyle = .fullScreen // 전체 화면으로 표시
        present(secondViewController, animated: true, completion: nil)
    }
    @objc func presentThirdViewController() {
        let ThirdviewController = ThirdviewController()
        ThirdviewController.modalPresentationStyle = .fullScreen // 전체 화면으로 표시
        present(ThirdviewController, animated: true, completion: nil)
    }
    @objc func presentFourthViewController() {
        let Fourthviewcontroller = Fourthviewcontroller()
        Fourthviewcontroller.modalPresentationStyle = .fullScreen // 전체 화면으로 표시
        present(Fourthviewcontroller, animated: true, completion: nil)
    }
    @objc private func searchIconTapped() {
        let url = URL(string: "https://dapi.kakao.com/v3/search/book?query=세이노")!
        
        var request = URLRequest(url: url)
        
        request.allHTTPHeaderFields = ["Authorization": "KakaoAK 7bcd5bd3829682983a085596328324d6"]
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            print(String(data: data!, encoding: .utf8))
        }.resume()
    }
}




































//    @objc private func searchIconTapped() {
//        let url = URL(string: "https://dapi.kakao.com/v3/search/book?query=세이노")!
//
//          var request = URLRequest(url: url)
//
//          request.allHTTPHeaderFields = ["Authorization": "KakaoAK 7bcd5bd3829682983a085596328324d6"]
//
//          URLSession.shared.dataTask(with: request) { data, _, _ in
//            print(String(data: data!, encoding: .utf8))
//          }.resume()
        



//let url = URL(string: "https://dapi.kakao.com/v3/search/book?query=세이노")!
//  var request = URLRequest(url: url)
//  request.allHTTPHeaderFields = ["Authorization": "KakaoAK <이 곳에 RESTAPI Key 를 넣으세요.>"]
//  URLSession.shared.dataTask(with: request) { data, _, _ in
//  print(String(data: data!, encoding: .utf8))
//  }.resume()

// print("Search icon tapped")
// print (searchTextField.text)
// 검색 버튼을 눌렀을 때 수행할 동작 구현
// 예: fetchBooks()
// fetchBooks()

