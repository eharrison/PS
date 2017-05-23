//
//  StringExtensions.swift
//  Quests
//
//  Created by Evandro Harrison Hoffmann on 1/26/17.
//  Copyright © 2017 Mindvalley. All rights reserved.
//

import Foundation

extension String {
    
    public var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    public func toDate(format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self) ?? Date()
    }
    
    var date: Date? {
        return date()
    }
    
    func date(withFormat format: String? = nil) -> Date? {
        let date = self.replacingOccurrences(of: ".000000Z", with: "Z")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format ?? "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: date)
    }
    
    func nsDate(withFormat format: String? = nil) -> NSDate? {
        if let date = date(withFormat: format) {
            return NSDate(timeIntervalSince1970: date.timeIntervalSince1970)
        }
        return nil
    }
    
    func filtering(_ string: String) -> String? {
        if self.contains(string) {
            return nil
        }
        return self
    }
}
