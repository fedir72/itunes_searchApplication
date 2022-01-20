//
//  SearchCell.swift
//  itunesParseJsonAplication
//
//  Created by Fedii Ihor on 18.01.2022.
//

import UIKit
import SDWebImage

class SearchCell: UITableViewCell {
    
    static let id = "SearchCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var trackImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCell(by track: Track) {
        
        self.nameLabel.text = track.artistName + " _ " + track.trackName
        self.albumLabel.text = track.country
        self.descriptionLabel.text = track.primaryGenreName
        
        guard let strImage = track.artworkUrl60 , let url = URL(string: strImage) else {return}
        trackImageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "photo"), completed: nil)
    }
    
}
