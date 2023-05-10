//
//  UIViewDashedBorder+Ext.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/10.
//

import UIKit

//  Explanation : UIView 테두리를 점선으로 만들어줌
//  Usage : yourView.addDashedBorder()
//  Author : Jayden Jang
//  Date : 2023/05/10.

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
