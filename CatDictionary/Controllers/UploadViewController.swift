//
//  UploadViewController.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/07.
//

import UIKit
import Then
import SnapKit
import PhotosUI

class UploadViewController: UIViewController {
    
    lazy var textLabel = UILabel().then {
        $0.text = "Any uploads must comply \n with the upload guidelines or face deletion."
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 13, weight: .bold)
    }
    
    lazy var imageBox = UIView().then {
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.cornerRadius = 10
    }
    
    lazy var imageView = UIImageView().then {
        $0.image = UIImage(systemName: "camera.on.rectangle")
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var centerView = UIView()
    
    lazy var constructionLabel = UILabel().then {
        $0.text = "Upload a .jpg or .png cat image."
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configPHP()
        
        uiConfig()
        configAddSubview()
        configAutolayout()
        
        self.present(picker, animated: true, completion: nil)
    }
}

extension UploadViewController {
    fileprivate func configPHP() {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selection = .ordered
        config.selectionLimit = 0
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
    }
}

extension UploadViewController {
    fileprivate func configAddSubview() {
        self.view.addSubview(centerView)
        centerView.addSubview(textLabel)
        centerView.addSubview(imageBox)
        imageBox.addSubview(imageView)
        self.view.addSubview(constructionLabel)
    }
}

extension UploadViewController {
    fileprivate func configAutolayout() {
        centerView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(100)
        }
        
        textLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        imageBox.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(textLabel.snp.bottom).offset(10)
            $0.size.equalTo(self.view.bounds.width * 3/5)
        }
        
        constructionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(40)
        }
        
        imageView.snp.makeConstraints {
            $0.edges.equalTo(imageBox.snp.edges)
        }
    }
}

extension UploadViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        return
    }
    
    
}

extension UploadViewController {
    fileprivate func uiConfig() {
        view.backgroundColor = .systemGray6
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        navigationController?.navigationBar.tintColor = .brown
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "Upload"
    }
}

extension UIView {
  func addDashedBorder() {
    let color = UIColor.red.cgColor

    let shapeLayer:CAShapeLayer = CAShapeLayer()
    let frameSize = self.frame.size
    let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

    shapeLayer.bounds = shapeRect
    shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.strokeColor = color
    shapeLayer.lineWidth = 2
    shapeLayer.lineJoin = CAShapeLayerLineJoin.round
    shapeLayer.lineDashPattern = [6,3]
    shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath

    self.layer.addSublayer(shapeLayer)
    }
}

// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct UploadViewController_Previews: PreviewProvider {
    static var previews: some View {
        UploadViewController()
            .getPreview()
            .ignoresSafeArea()
    }
}

#endif
