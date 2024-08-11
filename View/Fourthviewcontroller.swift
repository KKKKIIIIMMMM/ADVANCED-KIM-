//
//  Fourthviewcontroller.swift
//  ADVANCED"KIM"
//
//  Created by 김동준 on 8/9/24.
//

import UIKit

class Fourthviewcontroller: UIViewController {
    
    let button = UIButton()
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    // 샘플 책 페이지 이미지 배열 (각 이미지가 책의 한 페이지를 나타냅니다)
    
    struct test{
        var Imagetest: String
        var Explanation: String
    }
    
    var Arraytest = [
        test(Imagetest: "책을펼치다", Explanation:"설명입니다."),
        test(Imagetest: "책을펼치다", Explanation:"설명입니다."),
        test(Imagetest: "책을펼치다", Explanation:"설명입니다."),
        test(Imagetest: "책을펼치다", Explanation:"설명입니다."),
        test(Imagetest: "책을펼치다", Explanation:"설명입니다."),
        test(Imagetest: "책을펼치다", Explanation:"설명입니다."),
        test(Imagetest: "책을펼치다", Explanation:"설명입니다."),
        test(Imagetest: "책을펼치다", Explanation:"설명입니다."),
        test(Imagetest: "책을펼치다", Explanation:"설명입니다."),
        test(Imagetest: "책을펼치다", Explanation:"설명입니다."),
        test(Imagetest: "책을펼치다", Explanation:"설명입니다."),
        test(Imagetest: "책을펼치다", Explanation:"설명입니다.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupContentView()
        setupPages()
        setupbutton()
    }
        func setupbutton() {
            let setupbutton = UIButton(type: .system)
            setupbutton.setTitle("back", for: .normal)
            setupbutton.setTitleColor(.gray, for: .normal)
            setupbutton.addTarget(self, action: #selector(presentFourtViewController) , for: .touchUpInside)
            setupbutton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(setupbutton)
            
            NSLayoutConstraint.activate([
                setupbutton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                setupbutton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -270),
                setupbutton.topAnchor.constraint(equalTo: view.topAnchor, constant: -750),
                setupbutton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
            ])
        }
        @objc func presentFourtViewController() {
            dismiss(animated: true)
            let MainViewController = MainViewController()
            MainViewController.modalPresentationStyle = .fullScreen // 전체 화면으로 표시
            present(MainViewController, animated: true, completion: nil)
        }
   
        
        func setupScrollView() {
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(scrollView)
            
            
            NSLayoutConstraint.activate([
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
        
    func setupContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        // Content View constraints
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    func setupPages() {
        var previousPage: UIView? = nil
        
        for pageImageName in Arraytest {
            let exp = pageImageName.Explanation
            let testtext = UITextField()
            testtext.text = exp
            testtext.backgroundColor = .green
            contentView.addSubview(testtext)
            
            NSLayoutConstraint.activate([
                testtext.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
                testtext.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
                testtext.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: 0),
                testtext.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 300),
            ])
                
            let pageImageView = UIImageView()
            pageImageView.image = UIImage(named: pageImageName.Imagetest)
            pageImageView.contentMode = .scaleAspectFit
            pageImageView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(pageImageView)
            
            
            NSLayoutConstraint.activate([
                pageImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                pageImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
                pageImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: 10)
            ])
            
            if let previousPage = previousPage {
                pageImageView.topAnchor.constraint(equalTo: previousPage.bottomAnchor).isActive = true
            } else {
                pageImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            }
            
            previousPage = pageImageView
        }
        
        if let lastPage = previousPage {
            lastPage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        }
    }
}




























































//    func setupPages() {
//        var previousPage: UIView? = nil
//
//        for pageImageName in Arraytest {
//            let exp = pageImageName.Explanation
//            let testtext = UITextField()
//            testtext.text = exp
//            testtext.backgroundColor = .green
//            contentView.addSubview(testtext)
//
//            NSLayoutConstraint.activate([
//                testtext.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
//                testtext.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
//                testtext.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: 0),
//                testtext.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 300),
////              testtext.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50)
//            ])
//
//            let pageImageView = UIImageView()
//            pageImageView.image = UIImage(named: pageImageName.Imagetest)
//            pageImageView.contentMode = .scaleAspectFit
//            pageImageView.translatesAutoresizingMaskIntoConstraints = false
//            contentView.addSubview(pageImageView)
//
//
//            NSLayoutConstraint.activate([
//                pageImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//                pageImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
//                pageImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: 10)
//            ])
//
//            if let previousPage = previousPage {
//                pageImageView.topAnchor.constraint(equalTo: previousPage.bottomAnchor).isActive = true
//            } else {
//                pageImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//            }
//
//            previousPage = pageImageView
//        }
//
//        if let lastPage = previousPage {
//            lastPage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//        }
//    }
//}

