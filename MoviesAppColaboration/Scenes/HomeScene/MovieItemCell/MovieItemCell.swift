//
//  MovieItemCell.swift
//  MoviesAppColaboration
//
//  Created by Baramidze on 28.11.23.
//

import UIKit

class MovieItemCell: UITableViewCell {

    @IBOutlet weak var movieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
