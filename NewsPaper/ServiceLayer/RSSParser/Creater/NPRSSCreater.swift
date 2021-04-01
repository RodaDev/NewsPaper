//
//  NPRSSCreater.swift
//  NewsPaper
//
//  Created by RodaDev on 01.04.2021.
//

class NPRSSCreater {
    
    private init() {}
    
    static func createItem(data: [String: Any]) -> RSSItem? {
        
        let title = data[RSSField.title.rawValue] as? String
        let description = data[RSSField.description.rawValue] as? String
        let guid = data[RSSField.guid.rawValue] as? String
        
        let dateString = data[RSSField.pubDate.rawValue] as? String ?? ""
        let date = dateString.toDate(style: .rss)?.date
                
        let enclosureData = data[RSSField.enclosure.rawValue] as? [String: Any] ?? [:]
        let urlString = enclosureData["url"] as? String
        
        return RSSItem(guid: guid, pubDate: date, descript: description, title: title, imageURLString: urlString)
    }
    
    static func createChannel(data: [String: Any]) -> RSSChannel? {
        guard let title = data[RSSField.title.rawValue] as? String,
              let link = data[RSSField.link.rawValue] as? String else {
            return nil
        }
        return RSSChannel(title: title, link: link)
    }

}
