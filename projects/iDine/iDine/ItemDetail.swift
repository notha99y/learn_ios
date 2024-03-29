//
//  ItemDetail.swift
//  iDine
//
//  Created by Tan Ren Jie on 22/9/20.
//

import SwiftUI

struct ItemDetail: View {
    var item: MenuItem
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .font(.caption)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .offset(x:-5, y:-5)
            }
            Text(item.description)
                .padding()
            Spacer()
        }.navigationBarTitle(Text(item.name),
                             displayMode: .inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
        }
    }
}
