//
//  NewsCollectionConstructor.swift
//  NewsPaper
//
//  Created by RodaDev on 25.04.2021.
//

import UIKit

class NewsCollectionConstructor {
    
    static func createModule() -> NewsCollectionFeedViewController {
        let view = NewsCollectionFeedViewController()
        let interactor = FakeInteractor()
        let presenter = NewsFeedPresenter(interactor: interactor, view: view)
        view.presenter = presenter
        return view
    }
}
