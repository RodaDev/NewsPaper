//
//  NewsFeedProtocols.swift
//  NewsPaper
//
//  Created by RodaDev on 07.04.2021.
//
import UIKit
// View
protocol NewsFeedViewProtocol: class {
    func reload()
}

// Presenter
protocol NewsFeedPresenterProtocol: class {
    func viewDidLoad()
    func getItem(for indexPath: IndexPath) -> NewsFeedItem?
    func getNumbersOfItems() -> Int
}

// Interactor
protocol NewsFeedInteractorProtocol: class {
    func getNewsItems(completion: ([NewsFeedItem]) -> Void)
}

// Router
protocol NewsFeedRouterProtocol: class {
    func showDetails(_ item: NewsFeedItem)
}

