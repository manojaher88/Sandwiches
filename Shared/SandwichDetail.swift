//
//  SandwichDetail.swift
//  Sandwiches
//
//  Created by admin on 6/28/20.
//

import SwiftUI

struct SandwichDetail: View {
    let sandwich: Sandwich
    @State private var isZoomed: Bool = false
    
    var body: some View {
        VStack {
            
            Spacer(minLength: 0)
            Image(sandwich.imageName)
                .resizable()
                .aspectRatio(contentMode: isZoomed ? .fill : .fit)
                
                .onTapGesture {
                    withAnimation{
                        isZoomed.toggle()
                    }
                }
            
            Spacer(minLength: 0)
            
            if sandwich.isSpicy && !isZoomed {
                HStack {
                    Spacer()
                    Image(systemName: "flame.fill")
                        .scaledToFit()
                    Text("Spicy")
                        .font(Font.headline.smallCaps())
                    Spacer()
                }
                .padding(.all)
                .background(Color.red)
                .foregroundColor(Color.yellow)
                .transition(.move(edge: .bottom))
            }
        }
        .navigationTitle(sandwich.name)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SandwichDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SandwichDetail(sandwich: testData[2])
        }
    }
}
