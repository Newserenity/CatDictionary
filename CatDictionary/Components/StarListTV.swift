//
//  File.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/17.
//

import UIKit
import SnapKit
import Then

final class StarListTV: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var starListArr: StarListRes = []
    
    //데이터를 몇개 표시할것인지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starListArr.count
    }
    
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER.STAR_LIST_TV_CELL, for: indexPath)
        
        
        return cell
    }
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configDelegate()
        
        self.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(120)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - 대리자 설정
extension StarListTV {
    fileprivate func configDelegate() {
        self.dataSource = self
        self.delegate = self
        
        self.register(StarListTVCell.self, forCellReuseIdentifier: IDENTIFIER.STAR_LIST_TV_CELL)
    }
}


// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct StarListTV_Previews: PreviewProvider {
    static var previews: some View {
        StarListTV()
            .getPreview()
            .frame(width: 400, height: 60)
            .previewLayout(.sizeThatFits)
    }
}

#endif
