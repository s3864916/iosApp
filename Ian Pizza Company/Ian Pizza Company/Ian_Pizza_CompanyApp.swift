//
//  Ian_Pizza_CompanyApp.swift
//  Ian Pizza Company
//
//  Created by 紀詠恩 on 2020/12/4.
//

import SwiftUI

@main
struct Ian_Pizza_CompanyApp: App {
    var body: some Scene {
        WindowGroup {
            RootTabView(orderModel: OrderModel())
        }
    }
}
