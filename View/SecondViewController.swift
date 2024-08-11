//
//  SecondViewController.swift
//  ADVANCED"KIM"
//
//  Created by 김동준 on 8/9/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 제목 라벨
        let titleLabel = UILabel()
        titleLabel.text = "세이노의 가르침"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        
        // 저자 라벨
        let authorLabel = UILabel()
        authorLabel.text = "세이노"
        authorLabel.font = UIFont.systemFont(ofSize: 16)
        authorLabel.textAlignment = .center
        authorLabel.textColor = .gray
        
        // 책 표지 이미지뷰
        let coverImageView = UIImageView(image: UIImage(named: "세이노의 가르침"))
        coverImageView.contentMode = .scaleAspectFit
        
        // 가격 라벨
        let priceLabel = UILabel()
        priceLabel.text = "14,000원"
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        priceLabel.textAlignment = .center
        
        // 책 설명 텍스트뷰
        let descriptionTextView = UITextView()
        descriptionTextView.text = """
        인간은 변할 수 있고, 누구나 행복해 질 수 있다. 단 그러기 위해서는 '용기' 가 필요하다고 말한 철학자가 있다. 바로 프로이트, 용과 함께 '심리학의 3대 거장' 으로 일컬어지고 있는 알프레드 아들러다. [미움받을 용기]는 아들러 심리학에 관한 일본의 1인자 철학자 기시미 이치로와 베스트셀러 작가인 고가 후미타케의 저서로, 아들러의 심리학을 '대화체'로 쉽고 맛깔나게 정리하고 있다. 아들러의 심리학을 '대화체' 로 쉽고 맛깔나게 정리하고 있다. 아들러 심리학을 공부한 철학자와 세상에 부정적이고 열등감 많은
"""
        descriptionTextView.font = UIFont.systemFont(ofSize: 14)
        descriptionTextView.textColor = .green
        descriptionTextView.backgroundColor = .gray
        descriptionTextView.isEditable = false
        descriptionTextView.isScrollEnabled = true
        
        // 담기 버튼
        let addButton = UIButton(type: .system)
        addButton.setTitle("담기", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .green
        addButton.layer.cornerRadius = 10
        addButton.addTarget(self, action: #selector(showBookAddedAlert) , for: .touchUpInside)
        
        // 닫기 버튼
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("X", for: .normal)
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.backgroundColor = .gray
        closeButton.layer.cornerRadius = 10
        closeButton.addTarget(self, action: #selector(xbutton) , for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        // 스택뷰 설정
        let stackViewfirst = UIStackView(arrangedSubviews: [closeButton,addButton])
        stackViewfirst.axis = .horizontal
        stackViewfirst.spacing = 10
        stackViewfirst.alignment = .center
        stackViewfirst.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, authorLabel, coverImageView,priceLabel,descriptionTextView,])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        view.addSubview(stackViewfirst)
        view.backgroundColor = .white
        
        // SnapKit constraints
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(50)
            make.bottom.equalTo(stackViewfirst.snp.top).offset(-10)
        }
        
        coverImageView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(300)
        }
        
        descriptionTextView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(250)
        }
        
        stackViewfirst.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(0)
            make.height.equalTo(100)
        }
        
        closeButton.snp.makeConstraints { make in
            make.width.height.equalTo(50)
        }
        
        addButton.snp.makeConstraints { make in
            make.width.equalTo(225)
            make.height.equalTo(60)
        }
    }
        @objc func xbutton() {
        dismiss(animated: true)
    }
        @objc func showBookAddedAlert() {
        let alert = UIAlertController(title: "알림", message: "책 담기 완료!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
        
        
        
        
        
        
     











































































//    @objc func xbutton() {
//            let MainViewController = MainViewController()
//            MainViewController.modalPresentationStyle = .fullScreen
//            present(MainViewController, animated: true, completion: nil)



//    @objc func presentSecondViewController() {
//        dismiss(animated: true)
// let ViewController = ViewController()
// ViewController.modalPresentationStyle = .fullScreen // 전체 화면으로 표시
// present(ViewController, animated: true, completion: nil)
//    }
//    @objc func shoppingbasket() {
//        let ThirdviewController = ThirdviewController()
//        ThirdviewController.modalPresentationStyle = .fullScreen // 전체 화면으로 표시
//        present(ThirdviewController, animated: true, completion: nil)
//    }
//}
//        let MainViewController = MainViewController()
//        MainViewController.modalPresentationStyle = .fullScreen // 전체 화면으로 표시
//        present(MainViewController, animated: true, completion: nil)

