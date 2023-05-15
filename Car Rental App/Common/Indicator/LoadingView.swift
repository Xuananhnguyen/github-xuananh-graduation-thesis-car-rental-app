//
//  LoadingView.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 05/03/2023.
//

import UIKit

fileprivate let loadingViewTag = 1200
fileprivate let activityIndicatorTag = 1201

class LoadingView {
    // MARK: - Singleton
    static var shared = LoadingView()
    private init() {}
    // MARK: - Properties
    private var loadingCounter: Int = 0 {
        didSet {
            loadingCounter == 0 ? removeLoadingView() : addLoadingViewIfNeeded()
        }
    }
    // MARK: - Func
    func showLoading() {
        loadingCounter += 1
    }
    
    func hideLoading() {
        loadingCounter > 0 ? loadingCounter -= 1 : nil
    }
    
    private func removeLoadingView() {
        DispatchQueue.main.async {
            let keyWindow = UIApplication.shared.windows.first(where: {$0.isKeyWindow})
            let existingView = keyWindow?.viewWithTag(loadingViewTag)
            existingView?.removeFromSuperview()
        }
    }
    
    private func addLoadingViewIfNeeded() {
        guard let mainView = UIApplication.shared.windows.first(where: {$0.isKeyWindow}),
              // If there is another loading view on screen, we don't need to create a new one
              mainView.viewWithTag(loadingViewTag) == nil else {
            return
        }
        let loadingView = self.makeLoadingView()
        loadingView.tag = loadingViewTag
        mainView.addSubview(loadingView)
        loadingView.constraintAll(to: mainView)
    }
    
    private func makeLoadingView() -> UIView {
        let loadingView = UIView(frame: .zero)
        loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.layer.cornerRadius = 6
        activityIndicator.center = loadingView.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .white
        activityIndicator.style = .medium
        activityIndicator.startAnimating()
        activityIndicator.tag = activityIndicatorTag
        loadingView.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor),
            activityIndicator.heightAnchor.constraint(equalToConstant: 150),
            activityIndicator.widthAnchor.constraint(equalToConstant: 150)
        ])
        return loadingView
    }
}
