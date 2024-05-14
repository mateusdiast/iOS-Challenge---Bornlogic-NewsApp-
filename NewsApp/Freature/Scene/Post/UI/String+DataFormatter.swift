//
//  String+DataFormatter.swift
//  NewsApp
//
//  Created by mateusdias on 13/05/24.
//

import Foundation

extension String {

    func toLocalDateString(currentformat: String = "yyyy-MM-dd'T'HH:mm:ss'Z'") -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = currentformat
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        guard let utcDate = dateFormatter.date(from: self) else {
            return "Date is not Available"
        }
    
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        
        let newFormatterData = dateFormatter.string(from: utcDate)
        
        return newFormatterData
    }
}
