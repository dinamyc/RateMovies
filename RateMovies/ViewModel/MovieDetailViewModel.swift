//
//  MovieDetailViewModel.swift
//  RateMovies
//
//

import Foundation
import UIKit

class MovieDetailViewModel {

    var movie: Movie?
    
    func configureStarRatingView(in containerView: UIView) {
        let starRatingView = StarRatingView(frame: containerView.bounds, starCount: 5)
        containerView.addSubview(starRatingView)
    }
    
    func configureCircularProgressView(in containerView: UIView, percentage: CGFloat) {
        let circularProgressView = CircularProgressView(frame: containerView.bounds)
        circularProgressView.percentage = percentage
        containerView.addSubview(circularProgressView)
    }
    
    func loadMovieDetails(completion: @escaping (String?, String?, UIImage?) -> Void) {
        guard let movie = movie else {
            completion(nil, nil, nil)
            return
        }
        
        let titleLabelText = movie.title
        let formattedDate = DateFormatter.spanishFormattedDate(from: movie.releaseDate) ?? "\(SharedConstants.withoutDateRelease)"
        let descriptionLabelText = "\(SharedConstants.releaseDateLabel)\(formattedDate)"
        let imageUrl = "\(AppConstants.API.Shared.urlImage)\(movie.posterPath)"
        
        ImageLoader.shared.loadImage(from: imageUrl) { image in
            completion(titleLabelText, descriptionLabelText, image)
        }
    }
}
