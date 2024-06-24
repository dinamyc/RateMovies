//
//  MovieTableViewCell.swift
//  RateMovies
//
//

import UIKit

final class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageToShow: UIImageView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    static let cellIdentifier = "MovieTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loader.isHidden = true
    }
    
    func configurate(with movie: Movie) {
        title.text = "\(SharedConstants.titleLabel) \(movie.title)"
        
        let formattedDate = DateFormatter.spanishFormattedDate(from: movie.releaseDate) ?? "\(SharedConstants.withoutDateRelease)"
        descriptionLabel.text = "\(SharedConstants.releaseDateLabel)\(formattedDate)"
        
        loader.isHidden = false
        loader.startAnimating()
        
        let imageUrl = "\(AppConstants.API.Shared.urlImage)\(movie.posterPath)"
        
        ImageLoader.shared.loadImage(from: imageUrl) { [weak self] image in
            guard let self = self else { return }
            
            self.loader.stopAnimating()
            self.loader.isHidden = true

            if let image = image {
                self.imageToShow.image = image
            } else {
                if let defaultImage = UIImage(systemName: AppConstants.Design.ImageAsset.defaultImage.rawValue) {
                    self.imageToShow.image = defaultImage
                }
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
