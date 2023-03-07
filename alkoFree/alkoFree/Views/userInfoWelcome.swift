//
//  userInfo.swift
//  alkoFree
//
//  Created by Łukasz Muszyński on 05/03/2023.
//

import SwiftUI

struct userInfoWelcome: View {
    
    var user = "Łukasz"
    
    var body: some View {
        Text("Cześć \(user)")
    }
}

struct userInfo_Previews: PreviewProvider {
    static var previews: some View {
        userInfoWelcome()
    }
}
