//
//  NPNetworkManager.swift
//  NewsPaper
//
//  Created by RodaDev on 02.04.2021.
//

import Foundation

typealias NetworkCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

class NPNetworkManager {
    
    private let url: URL
    
    init(url: URL) {
        self.url = url
    }

    func getData(completion: @escaping NetworkCompletion) {
        let request = URLRequest(url: url)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request, completionHandler: completion)
        task.resume()
    }
}
