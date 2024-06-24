//
//  MovieTableViewCell.swift
//  RateMovies
//
//  Created by JL on 25/04/24.
//

import Foundation
import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    
    override func awakeFromNib()
       {
           super.awakeFromNib()
           // Initialization code
       }
    
    func configuration(with movie: Movie) {
        //movieImageView.image = movie.posterPath
        titleLabel.text = movie.title
        releaseDateLabel.text = movie.releaseDate
    }
    
    
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let image = UIImage(data: data)
            completion(image)
        }
        
        task.resume()
    }
    
    func setupImageView(imageView: UIImageView, withDefaultImage defaultImage: UIImage, fromURL urlString: String) {
        loadImage(from: urlString) { downloadedImage in
            DispatchQueue.main.async {
                imageView.image = downloadedImage ?? defaultImage
            }
        }
    }
}
