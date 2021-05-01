//
//  NewsFeedPresenter.swift
//  NewsPaper
//
//  Created by RodaDev on 07.04.2021.
//

import UIKit

class NewsFeedPresenter: NewsFeedPresenterProtocol {
    
    private var view: NewsFeedViewProtocol
    private var interactor: NewsFeedInteractorProtocol!
    private var newsItems = [NewsFeedItem]()
    
    init(interactor: NewsFeedInteractorProtocol, view: NewsFeedViewProtocol) {
        self.view = view
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        
        interactor.getNewsItems {
            self.newsItems = $0
        }
        view.reload()
    }
    
    func getItem(for indexPath: IndexPath) -> NewsFeedItem? {
        let index = indexPath.row
        if index >= newsItems.count {
            return nil
        }
        return newsItems[index]
    }
    
    func getNumbersOfItems() -> Int {
        return newsItems.count
    }
    
}
