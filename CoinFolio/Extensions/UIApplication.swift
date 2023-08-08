//
//  UIApplication.swift
//  CoinFolio
//
//  Created by Akhil on 5/9/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
