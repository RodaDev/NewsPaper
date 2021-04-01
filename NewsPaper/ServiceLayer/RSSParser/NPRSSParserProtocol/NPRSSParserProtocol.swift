//
//  NPRSSParserProtocol.swift
//  NewsPaper
//
//  Created by RodaDev on 01.04.2021.
//

protocol NPRSSParserProtocol: class {
    func parseChannelData(completion: RSSChannelBlock)
    func parseToItems(completion: RSSItemsBlock)
}
