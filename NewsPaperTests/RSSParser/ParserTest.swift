//
//  ParserTest.swift
//  NewsPaperTests
//
//  Created by RodaDev on 29.03.2021.
//

import XCTest
@testable import NewsPaper

class MockXMLData {
    static let dataString = """

    <rss version="2.0">
    <channel>
    <title>Газета.Ru - Новости дня</title>
    <link>https://www.gazeta.ru/news/lenta/</link>
    <description>Новости в режиме он-лайн из всех областей жизни. Собственная информация, а также сообщения крупнейших российских и мировых информационных агентств</description>
    <pubDate>Thu, 01 Apr 2021 15:12:18 +0300</pubDate>
    <language>ru</language>
    <copyright>Gazeta.Ru</copyright>
    <webMaster>webmaster@gazeta.ru</webMaster>
    <ttl>20</ttl>
    <item>
    <title>Байден снова оступился на трапе самолета</title>
    <link>https://www.gazeta.ru/politics/news/2021/04/01/n_15809576.shtml</link>
    <author>Газета.Ru</author>
    <pubDate>Thu, 01 Apr 2021 15:01:14 +0300</pubDate>
    <description>Президент США Джо Байден вновь оступился на трапе при подъеме на самолет Air Force One. Видеозапись публикует издание The Hill на своей странице в Twitter. "Президент Байден садится в самолет Air Force One для вылета в Питтсбург, ...</description>
    <enclosure url="https://img.gazeta.ru/files3/182/13518182/2021-03-19T183827Z_1836116830_RC2IEM9XM2MJ_RTRMADP_3_USA-BIDEN-pic905-895x505-43406.jpg" type="image/jpeg"/>
    <guid>https://www.gazeta.ru/politics/news/2021/04/01/n_15809576.shtml</guid>
    </item>
    <item>
    <title>Оператор Севпотока – 2 сообщил об активности военных кораблей в зоне строительства</title>
    <link>https://www.gazeta.ru/business/news/2021/04/01/n_15809600.shtml</link>
    <author>Газета.Ru</author>
    <pubDate>Thu, 01 Apr 2021 15:11:17 +0300</pubDate>
    <description>Компания-оператор проекта Северный поток – 2 Nord Stream 2 AG отмечает повышенную активность военных кораблей и гражданских судов в зоне укладки труб, сообщил директор филиала компании Андрей Минин. Его слова приводит ...</description>
    <enclosure url="https://img.gazeta.ru/files3/50/13509050/fortuna-pic905-895x505-34695.jpg" type="image/jpeg"/>
    <guid>https://www.gazeta.ru/business/news/2021/04/01/n_15809600.shtml</guid>
    </item>
    <item>
    <title>Кабмин выделит более 1,2 млрд рублей на поддержку туризма</title>
    <link>https://www.gazeta.ru/business/news/2021/04/01/n_15809594.shtml</link>
    <author>Газета.Ru</author>
    <pubDate>Thu, 01 Apr 2021 15:08:15 +0300</pubDate>
    <description>Правительство выделит свыше 1,2 млрд рублей на грантовую поддержку проектов в сфере туризма. Об этом заявил премьер-министр России Михаил Мишустин в четверг, 1 апреля, на заседании кабмина. По его словам, эти вклады помогут улучшить ...</description>
    <enclosure url="https://img.gazeta.ru/files3/604/13498604/upload-RIAN_178869.HR-pic905-895x505-37852.jpg" type="image/jpeg"/>
    <guid>https://www.gazeta.ru/business/news/2021/04/01/n_15809594.shtml</guid>
    </item>
    <item>
    <title>Глава СБР Майгуров усомнился в переходе Ушкиной в сборную Румынии</title>
    <link>https://www.gazeta.ru/sport/news/2021/04/01/n_15808838.shtml</link>
    <author>Газета.Ru</author>
    <pubDate>Thu, 01 Apr 2021 14:54:13 +0300</pubDate>
    <description>Президент Союза биатлонистов России (СБР) Виктор Майгуров усомнился в возможном переходе Натальи Ушкиной в сборную Румынии. Об этом сообщает ТАСС. По его мнению, Международный союз биатлонистов (IBU) может не одобрить данный трансфер. ...</description>
    <enclosure url="https://img.gazeta.ru/files3/989/13148989/RIAN_6284328.HR-pic905-895x505-72078.jpg" type="image/jpeg"/>
    <guid>https://www.gazeta.ru/sport/news/2021/04/01/n_15808838.shtml</guid>
    </item>
    <item>
    <title>Пострадавшая обвинила блогера Эдварда Била в ДТП на Садовом кольце</title>
    <link>https://www.gazeta.ru/auto/news/2021/04/01/n_15809522.shtml</link>
    <author>Газета.Ru</author>
    <pubDate>Thu, 01 Apr 2021 14:49:43 +0300</pubDate>
    <description>Аварию с участием пяти легковых машин на Садовом кольце спровоцировал владелец синей Audi RS 6 Avant, блогер Эдвард Бил (настоящее имя Эдуард Биль. – Примечание "Газеты.Ru"), заявила полиции одна из пострадавших. Об этом ...</description>
    <enclosure url="https://img.gazeta.ru/files3/148/13543148/upload-578043-pic905-895x505-71812.jpg" type="image/jpeg"/>
    <guid>https://www.gazeta.ru/auto/news/2021/04/01/n_15809522.shtml</guid>
    </item>
    <item>
    <title>Депутат Госдумы рассказал, почему иностранные дипломаты уезжают из КНДР</title>
    <link>https://www.gazeta.ru/politics/news/2021/04/01/n_15809534.shtml</link>
    <author>Газета.Ru</author>
    <pubDate>Thu, 01 Apr 2021 14:49:11 +0300</pubDate>
    <description>Большинство иностранных дипломатов уехали из КНДР из-за жестких ограничений, введенных в стране на фоне пандемии коронавируса. Об этом заявил депутат Государственной думы Казбек Тайсаев со ссылкой на посла в республике Александра Мацегора, ...</description>
    <enclosure url="https://img.gazeta.ru/files3/832/13492832/qq-pic905-895x505-52557.jpg" type="image/jpeg"/>
    <guid>https://www.gazeta.ru/politics/news/2021/04/01/n_15809534.shtml</guid>
    </item>
    <item>
    <title>Минкульт разрешил показать полную версию гей-драмы "Супернова"</title>
    <link>https://www.gazeta.ru/culture/news/2021/04/01/n_15809516.shtml</link>
    <author>Газета.Ru</author>
    <pubDate>Thu, 01 Apr 2021 14:37:46 +0300</pubDate>
    <description>Минкультуры России выдало прокатное удостоверение полной версии гей-драмы "Супернова" режиссера Гарри Макквина, передает "Интерфакс" со ссылкой на пресс-службу компании "Уорлд пикчерз". Прокат картины ...</description>
    <enclosure url="https://img.gazeta.ru/files3/996/13508996/supernova-pic905-895x505-1221.jpg" type="image/jpeg"/>
    <guid>https://www.gazeta.ru/culture/news/2021/04/01/n_15809516.shtml</guid>
    </item>
    <item>
    <title>"Северный поток – 2" построен на 95%</title>
    <link>https://www.gazeta.ru/business/news/2021/04/01/n_15809492.shtml</link>
    <author>Газета.Ru</author>
    <pubDate>Thu, 01 Apr 2021 14:31:07 +0300</pubDate>
    <description>Российский газопровод "Северный поток – 2" построен на 95%, заявили в компании-операторе проекта Nord Stream 2 AG. Об этом сообщает ТАСС. По состоянию на 31 марта уложено 2 339 км труб из запланированных 2 460 ...</description>
    <enclosure url="https://img.gazeta.ru/files3/528/13478528/nsp2-connecting-pipe-sections-above-water-axel-schmidt-2-201908_large_rgb-pic905-895x505-31106.jpg" type="image/jpeg"/>
    <guid>https://www.gazeta.ru/business/news/2021/04/01/n_15809492.shtml</guid>
    </item>
    <item>
    <title>Азербайджан обратится в ФИФА из-за флага Нагорного Карабаха</title>
    <link>https://www.gazeta.ru/sport/news/2021/04/01/n_15808850.shtml</link>
    <author>Газета.Ru</author>
    <pubDate>Thu, 01 Apr 2021 14:29:28 +0300</pubDate>
    <description>Ассоциация футбольных федераций Азербайджана (АФФА) обратится в Международную федерацию футбола (ФИФА) из-за флага Нагорного Карабаха на матче Армения - Румыния в рамках отборочного турнира чемпионата мира 2022 года. Соответствующий пост ...</description>
    <guid>https://www.gazeta.ru/sport/news/2021/04/01/n_15808850.shtml</guid>
    </item>
    <item>
    <title>Выдворенные из Италии российские дипломаты вылетели в Москву</title>
    <link>https://www.gazeta.ru/politics/news/2021/04/01/n_15809438.shtml</link>
    <author>Газета.Ru</author>
    <pubDate>Thu, 01 Apr 2021 14:28:10 +0300</pubDate>
    <description>Два российских дипломата, высланные из Италии в связи с делом о шпионаже, вылетели в Москву. Об этом сообщает итальянское агентство "Нова". Отмечается, что самолет с дипломатами на борту вылетел из римского аэропорта ...</description>
    <enclosure url="https://img.gazeta.ru/files3/576/13541576/Depositphotos_153066924_l-2015-pic905-895x505-84816.jpg" type="image/jpeg"/>
    <guid>https://www.gazeta.ru/politics/news/2021/04/01/n_15809438.shtml</guid>
    </item>
    <item>
    <title>Глава департамента Минпромторга задержан в Москве</title>
    <link>https://www.gazeta.ru/business/news/2021/04/01/n_15809258.shtml</link>
    <author>Газета.Ru</author>
    <pubDate>Thu, 01 Apr 2021 14:20:40 +0300</pubDate>
    <description>В Москве в рамках уголовного дела о превышении должностных полномочий задержан директор департамента металлургии и стройматериалов Минпромторга России Павел Серватинский. Об этом сообщает ТАСС со ссылкой на источник в правоохранительных ...</description>
    <enclosure url="https://img.gazeta.ru/files3/214/13543214/TASS_22411225-pic905-895x505-62343.jpg" type="image/jpeg"/>
    <guid>https://www.gazeta.ru/business/news/2021/04/01/n_15809258.shtml</guid>
    </item>
    <item>
    <title>Путин предложил переназначить Москалькову омбудсменом</title>
    <link>https://www.gazeta.ru/politics/news/2021/04/01/n_15809414.shtml</link>
    <author>Газета.Ru</author>
    <pubDate>Thu, 01 Apr 2021 14:18:26 +0300</pubDate>
    <description>Российский президент Владимир Путин предложил Государственной Думе переназначить Татьяну Москалькову уполномоченным по правам человека в России, сообщает пресс-служба Кремля. "Владимир Путин внес в Государственную Думу кандидатуру ...</description>
    <enclosure url="https://img.gazeta.ru/files3/484/13462484/upload-RIAN_6059971.HR-pic905-895x505-27392.jpg" type="image/jpeg"/>
    <guid>https://www.gazeta.ru/politics/news/2021/04/01/n_15809414.shtml</guid>
    </item>
    <item>
    <title>Штайнмайер привился первой дозой AstraZeneca</title>
    <link>https://www.gazeta.ru/social/news/2021/04/01/n_15809366.shtml</link>
    <author>Газета.Ru</author>
    <pubDate>Thu, 01 Apr 2021 14:07:14 +0300</pubDate>
    <description>Президент Германии Франк-Вальтер Штайнмайер привился первой дозой вакцины AstraZeneca от коронавируса. Об этом сообщает издание Bild. Отмечается, что 65-летний глава государства получил вакцину в Берлине в больнице бундесвера. Штайнмайер ...</description>
    <enclosure url="https://img.gazeta.ru/files3/816/12770816/upload-RTS2S92F-pic905-895x505-6120.jpg" type="image/jpeg"/>
    <guid>https://www.gazeta.ru/social/news/2021/04/01/n_15809366.shtml</guid>
    </item>
    <item>
    <title>Автомобиль блогера Эдварда Била попал в крупное ДТП на Садовом кольце</title>
    <link>https://www.gazeta.ru/auto/news/2021/04/01/n_15809348.shtml</link>
    <author>Газета.Ru</author>
    <pubDate>Thu, 01 Apr 2021 14:03:14 +0300</pubDate>
    <description>Автомобиль Audi RS 6 Avant, принадлежащий блогеру Эдварду Билу (настоящее имя Эдуард Биль. – Примечание "Газеты.Ru"), попал в крупную аварию с участием пяти машин на Садовом кольце в Москве. Об этом сообщает РИА ...</description>
    <enclosure url="https://img.gazeta.ru/files3/142/13543142/upload-578042-pic905-895x505-90124.jpg" type="image/jpeg"/>
    <guid>https://www.gazeta.ru/auto/news/2021/04/01/n_15809348.shtml</guid>
    </item>
    <item>
    <title>Дептранс уточнил данные о пострадавшей в результате ДТП на Садовом кольце</title>
    <link>https://www.gazeta.ru/auto/news/2021/04/01/n_15809330.shtml</link>
    <author>Газета.Ru</author>
    <pubDate>Thu, 01 Apr 2021 13:54:18 +0300</pubDate>
    <description>В результате ДТП с пятью автомобилями в центре Москвы женщина-водитель Volkswagen находится в реанимации, сообщает Дептранс столицы в Telegram-канале. До этого поступила информация, что женщина скончалась. Там отметили, что машины скорой ...</description>
    <enclosure url="https://img.gazeta.ru/files3/142/13543142/upload-578042-pic905-895x505-90124.jpg" type="image/jpeg"/>
    <guid>https://www.gazeta.ru/auto/news/2021/04/01/n_15809330.shtml</guid>
    </item>
    <rss2lj:owner xmlns:rss2lj="http://rss2lj.net/NS">gazeta_admin</rss2lj:owner>
    </channel>
    </rss>

    """
    
    static let data = Data(dataString.utf8)
}

class ParserTest: XCTestCase {

    var parser: NPRSSParser!
    var items: [RSSItem]?
    var channel: RSSChannel?

    override func setUpWithError() throws {
        let xmlParser = XMLParser(data: MockXMLData.data)
        parser = NPRSSParser.init(xmlParser: xmlParser)
        xmlParser.delegate = parser
        parser.parseToItems { (items) in
            self.items = items
        }
        parser.parseChannelData { (channel) in
            self.channel = channel
        }
    }

    override func tearDownWithError() throws {
        parser = nil
        items = nil
        channel = nil
    }

    func testItemsHasData() {
        
        XCTAssertNotNil(items?.first, "first item is nil")
    }
    
    func testItemCorrectData() {
        guard let item = items?[1] else {
            XCTAssert(true, "first item is nil")
            return
        }
        XCTAssertEqual(item.title, "Оператор Севпотока – 2 сообщил об активности военных кораблей в зоне строительства")
        XCTAssertEqual(item.pubDate, Date.init(timeIntervalSince1970: 1617279077))
        XCTAssertEqual(item.descript, "Компания-оператор проекта Северный поток – 2 Nord Stream 2 AG отмечает повышенную активность военных кораблей и гражданских судов в зоне укладки труб, сообщил директор филиала компании Андрей Минин. Его слова приводит ...")
        XCTAssertEqual(item.guid, "https://www.gazeta.ru/business/news/2021/04/01/n_15809600.shtml")
        XCTAssertEqual(item.imageURLString, "https://img.gazeta.ru/files3/50/13509050/fortuna-pic905-895x505-34695.jpg")
        
    }
    
        func testChannelNil () {
            XCTAssertNotNil(channel, "channel is nil")
        }
    

    func testChannel() {
        guard let title = channel?.title,
              let link = channel?.link else {
            XCTAssert(false, "channel vals is nil")
            return
        }
        XCTAssertEqual(title, "Газета.Ru - Новости дня")
        XCTAssertEqual(link, "https://www.gazeta.ru/news/lenta/")
    }
}
