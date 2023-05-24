//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Rodrigo Garcia Olvera on 27/02/23.
//

import SwiftUI
 
struct RecipeCategoryGridView: View {
  @StateObject private var recipeData = RecipeData()
 
  var body: some View {
      let columns = [GridItem(), GridItem()]
      NavigationView {
        ScrollView{
            LazyVGrid(columns: columns, content: {
              ForEach(MainInformation.Category.allCases,
                      id: \.self) { category in
                  NavigationLink(
                    destination: RecipesListView(category: category)
                                  .environmentObject(recipeData),
                                label: {
                                  CategoryView(category: category)
                                })
              }
            })
            .navigationTitle("Categories Chidas")
        }

    }
  }
}

struct CategoryView: View {
    let category: MainInformation.Category
    
    var body: some View {
        ZStack{
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.35)
            Text(category.rawValue)
                .font(.title)
        }
    }
}
 
struct RecipeCategoryGridView_Previews: PreviewProvider {
  static var previews: some View {
    RecipeCategoryGridView()
  }
}
