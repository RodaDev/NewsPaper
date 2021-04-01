//
//  NPRSSParser.swift
//  NewsPaper
//
//  Created by RodaDev on 29.03.2021.
//

typealias RSSItemsBlock = (([RSSItem]) -> Void)?
typealias RSSChannelBlock = ((RSSChannel) -> Void)?

import Foundation
import SwiftDate

class NPRSSParser: NSObject {
    let xmlParser: XMLParser
    
    private var currentElement = ""
    
    private var itemData: [String : Any] = [:]
    private var channelData: [String : Any] = [:]
    
    private var items = [RSSItem]()
    private var channel: RSSChannel?
    
    init(xmlParser: XMLParser) {
        self.xmlParser = xmlParser
    }
}

extension NPRSSParser: NPRSSParserProtocol {
    func parseChannelData(completion: RSSChannelBlock) {
        xmlParser.parse()
        if let channel  = channel,
           let completion = completion {
            
            completion(channel)
        }
    }
    
    func parseToItems(completion: RSSItemsBlock) {
        xmlParser.parse()
        completion?(items)
    }
}

extension NPRSSParser: XMLParserDelegate {
    func parser(_ parser: XMLParser,
                didStartElement elementName: String,
                namespaceURI: String?,
                qualifiedName qName: String?,
                attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        
        if elementName == RSSField.item.rawValue {
            resetCurrentItemValues()
        }
        
        if elementName == RSSField.channel.rawValue {
            resetCurrentChannelValues()
        }
        
        if elementName == RSSField.enclosure.rawValue {
            itemData[elementName] = attributeDict
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let preparedString = prepare(string)
        
        if let currentValue = itemData[currentElement] as? String {
            itemData[currentElement] = currentValue + preparedString
        } else if itemData[currentElement] == nil {
            itemData[currentElement] = preparedString
        }
         
        if let currentChannelData = channelData[currentElement] as? String,
           !currentChannelData.isEmpty {
            return
        }
        channelData[currentElement] = preparedString
    }
    
    func parser(_ parser: XMLParser,
                didEndElement elementName: String,
                namespaceURI: String?,
                qualifiedName qName: String?) {
        if elementName == RSSField.item.rawValue {
            if let item = NPRSSCreater.createItem(data: itemData) {
                items.append(item)
            }
        }
        if elementName == RSSField.channel.rawValue {
            channel = NPRSSCreater.createChannel(data: channelData)
        }
    }
    
    //MARK: - Private
    
    private func resetCurrentItemValues() {
        itemData.keys.forEach {
            itemData[$0] = ""
        }
    }
    
    private func resetCurrentChannelValues() {
        channelData.keys.forEach {
            itemData[$0] = ""
        }
    }
    
    private func prepare(_ string: String) -> String {
        return string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
