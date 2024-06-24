//
//  File.swift
//  RateMovies
//
//

import UIKit
import StoreKit

class MovieDetailViewController: UIViewController {
    var viewModel = MovieDetailViewModel()
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var moreInformation: UIView!
    @IBOutlet private weak var percentageView: UIView!
    @IBOutlet private weak var rateButton: RoundedButton!
    @IBOutlet private var movieLabelDetail: UIView!
    @IBOutlet private weak var instructionsLabel: UILabel!
    @IBOutlet private weak var descriptionText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        configureUI()
    }
    
    private func setupViewModel() {
        viewModel.loadMovieDetails { [weak self] title, description, image in
            guard let self = self else { return }
            
            if let title = title {
                self.titleLabel.text = title
            }
            if let description = description {
                self.descriptionLabel.text = description
            }
            if let image = image {
                self.imageView.image = image
            } else {
                if let defaultImage = UIImage(systemName: AppConstants.Design.ImageAsset.defaultImage.rawValue) {
                    self.imageView.image = defaultImage
                }
            }
            
            self.descriptionText.text = AppConstants.Strings.Shared.acceptaceInPercentage
            self.instructionsLabel.text = AppConstants.Strings.Shared.instructionActionRate
        }
    }
    
    private func configureUI() {
        viewModel.configureStarRatingView(in: moreInformation)
        
        guard let average = viewModel.movie?.average else { return }
        viewModel.configureCircularProgressView(in: percentageView, percentage: CGFloat(average * 10))
        
        rateButton.setTitle(AppConstants.Strings.Shared.rateMovieInstruction, for: .normal)
        rateButton.isEnabled = true
        rateButton.tintColor = .white
    }
    
    @IBAction func rateAMovie(_ sender: Any) {
        let alertController = UIAlertController(title: SharedConstants.titleApp, message: SharedConstants.rateMovieInstruction, preferredStyle: .alert)
        let okAction = UIAlertAction(title: SharedConstants.okButtonTile, style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func closeDetail(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
