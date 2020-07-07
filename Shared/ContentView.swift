//
//  ContentView.swift
//  Shared
//
//  Created by admin on 6/28/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var sandwichStore: SandwichStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sandwichStore.sandwiches) { sandwich in
                    SandwichCell(sandwich: sandwich)
                }
                .onMove { indecies, newOffset in
                    moveSandwiches(from: indecies, to: newOffset)
                }
                .onDelete { indexSet in
                    removeSandwiches(at: indexSet)
                }
                HStack {
                    Spacer()
                    Text("\(sandwichStore.sandwiches.count) sandwiches")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationTitle("Sandwiches")
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
            }
//            .navigationBarItems(leading: Button("Add", action: makeSandwich), trailing: EditButton())
            
            Image("Sandwich cartoon")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        
        
        
    }
    
    func makeSandwich() {
        withAnimation {
            sandwichStore.sandwiches.append(Sandwich(name: "Patty melt", ingredientCount: 3))
        }
    }
    
    func moveSandwiches(from index:IndexSet, to: Int) {
        withAnimation {
            sandwichStore.sandwiches.move(fromOffsets: index, toOffset: to)
        }
    }
    
    func removeSandwiches(at index:IndexSet) {
        withAnimation {
            sandwichStore.sandwiches.remove(atOffsets: index)
        }
    }
}

struct SandwichCell: View {
    var sandwich: Sandwich
    var body: some View {
        NavigationLink(destination: SandwichDetail(sandwich: sandwich)) {
            Image(sandwich.thumbnailName)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(8.0)
            
            VStack(alignment: .leading) {
                Text(sandwich.name)
                Text("\(sandwich.ingredientCount) ingredients")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(sandwichStore: testStore)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            ContentView(sandwichStore: testStore)
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
                
        }
    }
}
