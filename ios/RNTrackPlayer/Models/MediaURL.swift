//
//  MediaURL.swift
//  RNTrackPlayer
//
//  Created by David Chavez on 12.08.17.
//  Copyright © 2017 David Chavez. All rights reserved.
//

import Foundation

struct MediaURL {
    let value: URL
    let isLocal: Bool
    private let originalObject: Any
    
    init?(object: Any?) {
        guard let object = object else { return nil }
        originalObject = object
        
        if let localObject = object as? [String: Any] {
            let uri = localObject["uri"] as! String
            isLocal = uri.contains("http") ? false : true
            let encodedURI = uri.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            value = URL(string: encodedURI.replacingOccurrences(of: "file://", with: ""))!
        } else {
            // ESSE TRECHO FOI COMENTADO PARA FUNCIONAR COM O FIREBASE STORAGE
            let url = object as! String
            // let urlencoded = url.removingPercentEncoding
            isLocal = url.lowercased().hasPrefix("file://")
            if true
            // ESSE TRECHO FOI COMENTADO PARA FUNCIONAR COM O FIREBASE STORAGE
            // let encoded = urlencoded!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed
            //     .union(.urlHostAllowed)
            //     .union(.urlPasswordAllowed)
            //     .union(.urlQueryAllowed)
            //     .union(.urlUserAllowed)) 
            {
                value = URL(string: url.replacingOccurrences(of: "file://", with: ""))!
            } else {
                value = URL(string: url.replacingOccurrences(of: "file://", with: ""))!
            }
        }
    }
}
