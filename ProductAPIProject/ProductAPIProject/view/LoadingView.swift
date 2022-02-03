//
//  LoadingView.swift
//  LoadingView
//
//  Created by Eman Elrefai on 03.02.22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20)  {
            
            Image("loader").resizable().frame(width: 120, height: 170).cornerRadius(10)
            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
