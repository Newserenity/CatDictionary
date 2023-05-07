//
//  ViewController+Ext.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/07.
//

import UIKit

#if DEBUG // 전처리기

import SwiftUI

extension UIViewController {
    
    private struct VCRepresentable: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
    }
    
    func getPreview() -> some View {
        VCRepresentable(viewController: self)
    }
}

#endif
