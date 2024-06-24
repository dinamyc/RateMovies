//
//  CustomAlertViewController.swift
//  RateMovies
//
//

import UIKit

class CustomAlertViewController: UIViewController {
    
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var buttonToAction: UIButton!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var viewModel: CustomAlertViewModel!
    
    convenience init(viewModel: CustomAlertViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        image.image = viewModel.image
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        
    }
    @IBAction func actionButton(_ sender: Any) {
        viewModel.action?()
    }
}
