//
//  MoviesViewController.swift
//  RateMovies
//
//

import UIKit

final class MoviesViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var activityIndicator: UIActivityIndicatorView?
    private var viewModel = MovieListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        loadMovies()
    }
    
    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil),
                           forCellReuseIdentifier: MovieTableViewCell.cellIdentifier)
        
        setupActivityIndicator()
    }
    
    private func setupBindings() {
        viewModel.onErrorHandling = { [weak self] message in
            self?.showErrorAlert(error: message)
        }
    }
    
    private func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator?.center = self.view.center
        activityIndicator?.hidesWhenStopped = true
        if let indicator = activityIndicator {
            self.view.addSubview(indicator)
        }
    }
    
    private func loadMovies() {
        activityIndicator?.startAnimating()
        viewModel.fetchTopRatedMovies { [weak self] success in
            self?.activityIndicator?.stopAnimating()
            if success {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func showMovieDetail(for movie: Movie) {
        guard let movieDetailVC = storyboard?.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController else {
            return
        }
        
        movieDetailVC.viewModel.movie = movie
        present(movieDetailVC, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height - 100 - scrollView.frame.size.height) {
            loadMovies()
        }
    }
    
    private func showErrorAlert(error: String) {
        let alert = UIAlertController(title: SharedConstants.errorTitle, message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: SharedConstants.okButtonTile, style: .default))
        self.present(alert, animated: true)
    }
    
    @IBAction func rateMovie(_ sender: Any) {
        
        guard let customAlert = storyboard?.instantiateViewController(withIdentifier: "CustomAlertViewController") as? CustomAlertViewController else {
            return
        }
        
        let viewModel = CustomAlertViewModel(title: AppConstants.Strings.Shared.titleApp,
                                             description:  AppConstants.Strings.Shared.thanksMessage,
                                             image: UIImage(systemName:AppConstants.Design.ImageAsset.success.rawValue )?.withTintColor(.green)) {
            customAlert.dismiss(animated: true)
        }
        
        customAlert.modalPresentationStyle = .overFullScreen
        
        customAlert.viewModel = viewModel
        
        present(customAlert, animated: true, completion: nil)
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell {
            let movie = viewModel.movieAtIndex(indexPath.row)
            cell.configurate(with: movie)
            return cell
        } else {
            fatalError(SharedConstants.errorGenericDescriptionCell)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.movieAtIndex(indexPath.row)
        showMovieDetail(for: movie)
    }
}
