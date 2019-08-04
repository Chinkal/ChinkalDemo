//
//  Extension.swift
//  ChinkalDemo
//
//  Created by chinkalshah on 03/08/19.
//  Copyright © 2019 chinkalshah. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension NSArray {
    public func toDictionary<Key: Hashable>(with selectKey: (Element) -> Key) -> [Key:Element] {
        var dict = [Key:Element]()
        for element in self {
            dict[selectKey(element)] = element
        }
        return dict
    }
}
