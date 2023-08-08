//
//  CoinFolioApp.swift
//  CoinFolio
//
//  Created by Akhil Tej on 25/06/24.
//

import SwiftUI

@main
struct CoinFolioApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack(){
                    HomeView()
                }.navigationBarHidden(true)
        }
    }
}
