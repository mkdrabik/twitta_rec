//
//  SearchView.swift
//  Twitta
//
//  Created by Mason Drabik on 11/28/23.
//

import SwiftUI

struct SearchView: View {
    @Binding var cs: ColorScheme
    @State var txt: String = ""
    @Binding var pushed: Bool
    
    var body: some View {
        NavigationView{
            TextField("Search", text: $txt)
                .onSubmit {
                    txt = ""
                }
                .padding(.bottom, 500)
                .textFieldStyle(.roundedBorder)
                .navigationBarTitle("Search", displayMode: .inline)
                .navigationBarItems(
                        leading:
                            Button(action:{}){
                                Image("mason")
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                    .clipShape(Circle())
                                },
                                trailing: Button(action: {
                                    pushed.toggle()
                                    if(pushed){
                                        cs = .dark
                                    } else {
                                        cs = .light
                                    }
                                }){
                                    Image(systemName: "moon.stars")
                                        .foregroundColor(.twitterBlue)
                    })
        }
    }
}

#Preview {
    SearchView(cs: .constant(.dark), pushed: .constant(true))
}
