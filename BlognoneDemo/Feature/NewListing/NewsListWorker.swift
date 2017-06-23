//
//  NewsListWorker.swift
//  BlognoneDemo
//
//  Created by Suraphan 'Rawd' Laokondee on 6/23/2560 BE.
//  Copyright (c) 2560 Suraphan 'Rawd' Laokondee. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

class NewsListWorker {
  // MARK: - Business Logic
  
  func fetchNewsFeed(completionHandler: (_ newsList: [News]) -> Void) {
    let news1 = News(title: "อยากเล่นไหม เกมมาริโอแบบ AR แค่สวม HoloLens ก็วิ่งเก็บเหรียญ โหม่งเห็ดเองได้",
                    creator: "sunnywalker", publishDate: Date())
    
    let news2 = News(title: "รัฐขอเข้าถึงข้อมูลของ Diamond Reynolds ผู้ให้บริการเครือข่าย Sprint ยอม แต่ Facebook ไม่ยอม",
                    creator: "sunnywalker", publishDate: Date())
    
    let news3 = News(title: "สัปดาห์สุดท้ายก่อนสิงคโปร์ควบคุม GrabCar/Uber คนสมัคร 39,000 คน รถติดสติกเกอร์แล้ว 27,000 คัน",
                     creator: "lew", publishDate: Date())
    
   completionHandler([news1, news2, news3])
  }
}