//
//  ImageLoader.swift
//  RateMovies
//
//

import UIKit

class ImageLoader {
    static let shared = ImageLoader()
    private let cache = NSCache<AnyObject, AnyObject>()

    private init() {}
    
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = cache.object(forKey: urlString as NSString) as? UIImage {
            completion(cachedImage)
            return
        }
        
        completion(UIImage(systemName: "hourglass"))
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.cache.setObject(image, forKey: urlString as NSString)
                    completion(image)
                } else {
                    completion(nil)
                }
            }
        }.resume()
    }
}
