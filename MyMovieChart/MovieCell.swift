//
//  MovieCell.swift
//  MyMovieChart
//
//  Created by 성기훈 on 2021/08/05.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet var title: UILabel! // 영화제목
    
    @IBOutlet var opendate: UILabel! // 영화 설명
    
    @IBOutlet var rating: UILabel! // 개봉일
    
    @IBOutlet var desc: UILabel! // 평점
}
