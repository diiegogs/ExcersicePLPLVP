//
//  PProductsViewModel.swift
//  ExcersicePLPLVP
//
//  Created by Juan Diego Garcia Serrano on 05/06/25.
//

import Foundation

class PProductsViewModel: ObservableObject {
    @Published internal var showLottie: Bool = false
    @Published internal var products: [Record] = []
    @Published internal var searchText: String = ""
    
    internal var filterProducts: [Record] {
        if searchText.isEmpty {
            products
        } else {
            products.filter({ $0.productDisplayName.localizedCaseInsensitiveContains(searchText) })
        }
    }
    
    init() {()}
    
    internal func resetValues() -> Void {
        showLottie = false
        products = []
        searchText = String()
    }
    
    internal func orderProducts() -> Void {
        products = products.sorted(by: { $0.productDisplayName < $1.productDisplayName })
    }
    
    internal func callGetProductsService() -> Void {
        DispatchQueue.main.async {
            self.showLottie = true
        }
        UServiceManager.shared.callService { [weak self] (response: ProductResponse?) in
            print("success")
            self?.products = response?.plpResults.records ?? []
            self?.showLottie = false
        } failure: { [weak self] err in
            print("failure")
            self?.products = []
            self?.showLottie = false
        }
    }
}
