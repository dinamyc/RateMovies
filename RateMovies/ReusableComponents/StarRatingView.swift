//
//  StarRatingView.swift
//  RateMovies
//
//

import UIKit

class StarRatingView: UIView {
    // Number of stars in the rating
    let starCount: Int
    
    // The current rating
    var rating: Int = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    // Array to hold the star buttons
    var starButtons = [UIButton]()
    
    // Initialization
    init(frame: CGRect, starCount: Int) {
        self.starCount = starCount
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Setup the view
    private func setupView() {
        for _ in 0..<starCount {
            let starButton = UIButton()
            starButton.setImage(UIImage(systemName: "star")?.withTintColor(.base900, renderingMode: .alwaysOriginal), for: .normal)
            starButton.setImage(UIImage(systemName: "star.fill")?.withTintColor(.base800, renderingMode: .alwaysOriginal), for: .selected)
            starButton.addTarget(self, action: #selector(starButtonTapped(_:)), for: .touchUpInside)
            starButtons.append(starButton)
            addSubview(starButton)
        }
    }
    
    // Layout the star buttons
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let starSize = CGSize(width: self.bounds.height, height: self.bounds.height)
        let spacing: CGFloat = 8
        var starFrame = CGRect(origin: .zero, size: starSize)
        
        for (index, button) in starButtons.enumerated() {
            starFrame.origin.x = CGFloat(index) * (starSize.width + spacing)
            button.frame = starFrame
            button.isSelected = index < rating
        }
    }
    
    // Handle tap on star button
    @objc func starButtonTapped(_ sender: UIButton) {
        guard let index = starButtons.firstIndex(of: sender) else { return }
        rating = index + 1
    }
}
