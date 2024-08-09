//
//  ThirdviewController.swift
//  ADVANCED"KIM"
//
//  Created by 김동준 on 8/9/24.
//

import UIKit

class ThirdviewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        setupBookViews()
        setupTabButtons()
    }
    
    func setupNavigationBar() {
        // 전체 삭제 버튼
        let deleteAllButton = UIButton(type: .system)
        deleteAllButton.setTitle("전체 삭제", for: .normal)
        deleteAllButton.setTitleColor(.lightGray, for: .normal)
        deleteAllButton.addTarget(self, action: #selector(presentthirdViewController) , for: .touchUpInside)
        deleteAllButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(deleteAllButton)
        
        // 타이틀 라벨
        let titleLabel = UILabel()
        titleLabel.text = "담은 책"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // 추가 버튼
        let addButton = UIButton(type: .system)
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(.green, for: .normal)
//        addButton.addTarget(self, action: #selector(clickadd) , for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            deleteAllButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            deleteAllButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: deleteAllButton.centerYAnchor),
            
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addButton.centerYAnchor.constraint(equalTo: deleteAllButton.centerYAnchor)
        ])
    }
    
    func setupBookViews() {
        let bookInfo = [
            ("세이노의 가르침", "세이노", "14,000원"),
            ("", "", ""),
            ("", "", "")
        ]
        
        var previousView: UIView? = nil
        
        for info in bookInfo {
            let bookView = createBookView(title: info.0, author: info.1, price: info.2)
            view.addSubview(bookView)
            
            NSLayoutConstraint.activate([
                bookView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                bookView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                bookView.heightAnchor.constraint(equalToConstant: 50)
            ])
            
            if let previousView = previousView {
                bookView.topAnchor.constraint(equalTo: previousView.bottomAnchor, constant: 10).isActive = true
            } else {
                bookView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
            }
            
            previousView = bookView
        }
    }
    
    func createBookView(title: String, author: String, price: String) -> UIView {
        let bookView = UIView()
        bookView.layer.borderWidth = 2
        bookView.layer.borderColor = UIColor.black.cgColor
        bookView.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bookView.addSubview(titleLabel)
        
        let authorLabel = UILabel()
        authorLabel.text = author
        authorLabel.font = UIFont.systemFont(ofSize: 12)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        bookView.addSubview(authorLabel)
        
        let priceLabel = UILabel()
        priceLabel.text = price
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        bookView.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: bookView.leadingAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: bookView.centerYAnchor),
            
            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            authorLabel.centerYAnchor.constraint(equalTo: bookView.centerYAnchor),
            
            priceLabel.trailingAnchor.constraint(equalTo: bookView.trailingAnchor, constant: -10),
            priceLabel.centerYAnchor.constraint(equalTo: bookView.centerYAnchor)
        ])
        
        return bookView
    }
    
    func setupTabButtons() {
        let searchTabButton = UIButton(type: .system)
//        searchTabButton.addTarget(self, action: #selector(presentthirdViewController) , for: .touchUpInside)
        searchTabButton.setTitle("검색 탭", for: .normal)
        searchTabButton.setTitleColor(.black, for: .normal)
        searchTabButton.layer.borderWidth = 2
        searchTabButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchTabButton)
        
        let savedBooksTabButton = UIButton(type: .system)
        savedBooksTabButton.setTitle("담은 책 리스트 탭", for: .normal)
        savedBooksTabButton.setTitleColor(.black, for: .normal)
        savedBooksTabButton.layer.borderWidth = 2
        savedBooksTabButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(savedBooksTabButton)
        
        NSLayoutConstraint.activate([
            searchTabButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchTabButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            searchTabButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            searchTabButton.heightAnchor.constraint(equalToConstant: 50),
            
            savedBooksTabButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            savedBooksTabButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            savedBooksTabButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            savedBooksTabButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    @objc func presentthirdViewController() {
        dismiss(animated: true)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//      let MainViewController = MainViewController()
//        MainViewController.modalPresentationStyle = .fullScreen // 전체 화면으로 표시
//      present(MainViewController, animated: true, completion: nil)
    }
//    @objc func clickadd() {
//        dismiss(animated: true)
//        let MainViewController = MainViewController()
//        MainViewController.modalPresentationStyle = .fullScreen // 전체 화면으로 표시
//        present(MainViewController, animated: true, completion: nil)
    }



//import UIKit
//
//class MainViewController: UIViewController {
//
//    let addButton = UIButton()
//    let deleteAllButton = UIButton()
//    let bookLabel = UILabel()
//    let priceLabel = UILabel()
//    let searchTabButton = UIButton()
//    let savedBooksTabButton = UIButton()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .white
//
//        setupNavigationBar()
//        setupBookView()
//        setupTabButtons()
//    }
//
//    func setupNavigationBar() {
//        let titleLabel = UILabel()
//        titleLabel.text = "담은 책"
//        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(titleLabel)
//
//        addButton.setTitle("추가", for: .normal)
//        addButton.setTitleColor(.green, for: .normal)
//        addButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(addButton)
//
//        deleteAllButton.setTitle("전체 삭제", for: .normal)
//        deleteAllButton.setTitleColor(.lightGray, for: .normal)
//        deleteAllButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(deleteAllButton)
//
//        NSLayoutConstraint.activate([
//            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//
//            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            addButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
//
//            deleteAllButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            deleteAllButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
//        ])
//    }
//
//    func setupBookView() {
//        let bookView = UIView()
//        bookView.layer.borderWidth = 1
//        bookView.layer.borderColor = UIColor.black.cgColor
//        bookView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(bookView)
//
//        bookLabel.text = "세이노의 가르침 세이노 14,000"
//        bookLabel.translatesAutoresizingMaskIntoConstraints = false
//        bookView.addSubview(bookLabel)
//
////        let authorLabel = UILabel()
////        authorLabel.text = "세이노"
////        authorLabel.font = UIFont.systemFont(ofSize: 12)
////        authorLabel.translatesAutoresizingMaskIntoConstraints = false
////        bookView.addSubview(authorLabel)
////
////        priceLabel.text = "14,000원"
////        priceLabel.translatesAutoresizingMaskIntoConstraints = false
////        bookView.addSubview(priceLabel)
//
//        NSLayoutConstraint.activate([
//            bookView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
//            bookView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            bookView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            bookView.heightAnchor.constraint(equalToConstant: 50),

//            bookLabel.leadingAnchor.constraint(equalTo: bookView.leadingAnchor, constant: 10),
//            bookLabel.centerYAnchor.constraint(equalTo: bookView.centerYAnchor),
//
//            authorLabel.leadingAnchor.constraint(equalTo: bookLabel.trailingAnchor, constant: 10),
//            authorLabel.centerYAnchor.constraint(equalTo: bookView.centerYAnchor),
//
//            priceLabel.trailingAnchor.constraint(equalTo: bookView.trailingAnchor, constant: -10),
//            priceLabel.centerYAnchor.constraint(equalTo: bookView.centerYAnchor)
//        ])
//    }
//
//    func setupTabButtons() {
//        searchTabButton.setTitle("검색 탭", for: .normal)
//        searchTabButton.setTitleColor(.black, for: .normal)
//        searchTabButton.layer.borderWidth = 1
//        searchTabButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(searchTabButton)
//
//        savedBooksTabButton.setTitle("담은 책 리스트 탭", for: .normal)
//        savedBooksTabButton.setTitleColor(.black, for: .normal)
//        savedBooksTabButton.layer.borderWidth = 1
//        savedBooksTabButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(savedBooksTabButton)
//
//        NSLayoutConstraint.activate([
//            searchTabButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            searchTabButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            searchTabButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
//            searchTabButton.heightAnchor.constraint(equalToConstant: 50),
//
//            savedBooksTabButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            savedBooksTabButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            savedBooksTabButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
//            savedBooksTabButton.heightAnchor.constraint(equalToConstant: 50)
//        ])
//    }
//}






//import UIKit
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //
//        let titleLabel = UILabel(frame: CGRect(x: 20, y: 140, width: 200, height: 30))
//        titleLabel.text = "담은 책"
//        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        //
//        let addButton = UIButton(frame: CGRect(x:20, y: 470, width: 150, height: 50))
//        addButton.setTitle("추가", for: .normal)
//        addButton.setTitleColor(.green, for: .normal)
//        addButton.translatesAutoresizingMaskIntoConstraints = false
//        //
//        let Deleteallbutton = UIButton(frame: CGRect(x:20, y: 470, width: 150, height: 50))
//        Deleteallbutton.setTitle("전체 삭제", for: .normal)
//        Deleteallbutton.setTitleColor(.lightGray, for: .normal)
//        Deleteallbutton.translatesAutoresizingMaskIntoConstraints = false
//
//        //검색창
//        let searchTextField = UITextField(frame: CGRect(x: 20, y: 80, width:310, height: 40))
//        searchTextField.placeholder = "sayno"
//        searchTextField.layer.cornerRadius = 20
//        searchTextField.layer.borderWidth = 1
//        searchTextField.layer.borderColor = UIColor.black.cgColor
//        searchTextField.textAlignment = .left
//        searchTextField.text = "sayno"
//
//        // 왼쪽 패딩 추가
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: searchTextField.frame.height))
//        searchTextField.leftView = paddingView
//        searchTextField.leftViewMode = .always
//
//        // 돋보기 아이콘 추가
//        let searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
//        searchIcon.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
//        let searchIconView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
//        searchIconView.addSubview(searchIcon)
//        searchTextField.rightView = searchIconView
//        // 오른쪽 오버레이 보기가 텍스트 필드에 나타날 떄를 제어하는 모드.
//        searchTextField.rightViewMode = .always
//
//        // 검색 결과 박스
//        let resultBox1 = UIView(frame: CGRect(x: 20, y: 240, width: 310, height: 50))
//        resultBox1.layer.borderWidth = 1
//        resultBox1.layer.borderColor = UIColor.black.cgColor
//
//        let resultBox2 = UIView(frame: CGRect(x: 20, y: 300, width: 310, height: 50))
//        resultBox2.layer.borderWidth = 1
//        resultBox2.layer.borderColor = UIColor.black.cgColor
//
//        let resultBox3 = UIView(frame: CGRect(x: 20, y: 360, width: 310, height: 50))
//        resultBox3.layer.borderWidth = 1
//        resultBox3.layer.borderColor = UIColor.black.cgColor
//
//        // 검색 결과 텍스트 추가
//        let resultText1 = UILabel(frame: CGRect(x:20, y: 1, width: 300, height: 50))
//        resultText1.text = "세이노의 가르침          세이노     14,000원"
//        resultBox1.addSubview(resultText1)
//
//        // 검색 탭 버튼
//        let searchTabButton = UIButton(frame: CGRect(x:20, y: 470, width: 150, height: 50))
//        searchTabButton.setTitle("검색 탭", for: .normal)
//        searchTabButton.setTitleColor(.black, for: .normal)
//        searchTabButton.layer.borderWidth = 1
//        searchTabButton.layer.borderColor = UIColor.black.cgColor
//
//        // 담은 책 리스트 탭 버튼
//        let savedBooksTabButton = UIButton(frame: CGRect(x: 180, y: 470, width: 150, height: 50))
//        savedBooksTabButton.setTitle("담은 책 리스트 탭", for: .normal)
//        savedBooksTabButton.setTitleColor(.black, for: .normal)
//        savedBooksTabButton.layer.borderWidth = 1
//        savedBooksTabButton.layer.borderColor = UIColor.black.cgColor
//
//        // 뷰에 추가
//        self.view.addSubview(searchTextField)
//        self.view.addSubview(resultBox1)
//        self.view.addSubview(resultBox2)
//        self.view.addSubview(resultBox3)
//        self.view.addSubview(searchTabButton)
//        self.view.addSubview(savedBooksTabButton)
//        self.view.addSubview(titleLabel)
//        view.addSubview(addButton)
//        view.addSubview(Deleteallbutton)
//        }
//    }

