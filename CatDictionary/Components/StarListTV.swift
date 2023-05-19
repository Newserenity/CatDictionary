//
//  File.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/17.
//

import UIKit
import SnapKit
import Then

final class StarListTV: UIView {
    
    var starListArr: StarListRes = []
    fileprivate lazy var tableView = UITableView().then {
        $0.showsVerticalScrollIndicator = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configProperty()
        configLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StarListTV {
    public func setStarListArr(_ arr: StarListRes) {
        self.starListArr  = arr
        self.tableView.reloadData()
    }
}

// MARK: - Setting Self
extension StarListTV {
    // self stored property
    fileprivate func configProperty() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.register(StarListTVCell.self, forCellReuseIdentifier: IDENTIFIER.STAR_LIST_TV_CELL)
    }
}

// MARK: - Deligate
extension StarListTV: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starListArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER.STAR_LIST_TV_CELL, for: indexPath) as! StarListTVCell
        
        let seq = String(starListArr[indexPath.row].id!)
        let date = starListArr[indexPath.row].date ?? "err"
        let imageId = starListArr[indexPath.row].image?.imageId ?? "err"
        let imageUrl = starListArr[indexPath.row].image?.imageUrl ?? "err"
        
        cell.setElement(seq: seq, imageId: imageId, date: date, imageUrl: imageUrl)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            // 삭제 작업 수행
            completionHandler(true)
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
}

// MARK: - autolayout
extension StarListTV {
    fileprivate func configLayout() {
        addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}


// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct StarListTV_Previews: PreviewProvider {
    static var previews: some View {
        StarListTV()
            .getPreview()
            .previewLayout(.sizeThatFits)
    }
}

#endif
