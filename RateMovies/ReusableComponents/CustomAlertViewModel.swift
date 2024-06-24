//
//  CustomAlertViewModel.swift
//  RateMovies
//
//

import UIKit

class CustomAlertViewModel {
    var title: String?
    var description: String?
    var image: UIImage?
    var action: (() -> Void)?
    
    init(title: String?, description: String?, image: UIImage?, action: (() -> Void)?) {
        self.title = title
        self.description = description
        self.image = image
        self.action = action
    }
}
