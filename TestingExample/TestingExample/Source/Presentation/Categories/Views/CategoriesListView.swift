//
//  CategoriesListView.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import SwiftUI

struct CategoriesListView: BaseView {
    
    // MARK: - Properties
    
    var viewModel: Self.ViewModel
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Select a category:")
                .bold()
                .padding(.bottom)
            
            ForEach(viewModel.categories, id: \.self) { category in
                Button(category) {
                    viewModel.didSelectCategory?(category)
                }
            }
        }
    }
}




extension CategoriesListView {
    
    class ViewModel: BaseViewModel {
        
        // MARK: - Properties
        
        var categories: [String]
        var didSelectCategory: ((String) -> ())?
        
        
        // MARK: - Init
        
        init(categories: [String], didSelectCategory: @escaping (String) -> ()) {
            self.categories = categories
            self.didSelectCategory = didSelectCategory
            super.init()
        }
        
    }
    
}
