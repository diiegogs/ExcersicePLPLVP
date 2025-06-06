//
//  PProductsViewModel.swift
//  ExcersicePLPLVP
//
//  Created by Juan Diego Garcia Serrano on 05/06/25.
//

import Foundation

class PProductsViewModel: ObservableObject {
    ///showLottie is used for present loader in view
    @Published internal var showLottie: Bool = false
    ///products is used for print all available products
    @Published internal var products: [Record] = []
    ///searchText is used for search between products
    @Published internal var searchText: String = ""

    internal var currentPage: Int = 1
    internal var contentPage = 10
    internal var loading: Bool = false
    internal var reload: Bool = true
    
    internal var filterProducts: [Record] {
        if searchText.isEmpty {
            products
        } else {
            products.filter({ $0.productDisplayName.localizedCaseInsensitiveContains(searchText) })
        }
    }
    
    private var queryParam: String {
        "?search-string=\(searchText)&page-number=\(currentPage)"
    }
    
    init() {()}
    
    internal func resetValues() -> Void {
        DispatchQueue.main.async {
            self.showLottie = false
            self.products = []
            self.searchText = ""
            self.currentPage = 1
            self.reload = true
        }
    }
    
    internal func orderProducts() -> Void {
        products = products.sorted(by: { $0.productDisplayName < $1.productDisplayName })
    }
    
    internal func callGetProductsService() -> Void {
        guard !loading && reload else { return }
        
        DispatchQueue.main.async {
            self.loading = true
            self.showLottie = true
        }
        
        UServiceManager.shared.callService(queryParam: queryParam) { [weak self] (response: ProductResponse?) in
            if let products = response?.plpResults.records, !products.isEmpty {
                self?.products.append(contentsOf: products)
                self?.currentPage += 1
                self?.reload = self?.currentPage ?? 1 <= self?.contentPage ?? 1
            } else {
                self?.reload = false
            }
            
            self?.loading = false
            self?.showLottie = false
            
        } failure: { [weak self] err in
            self?.reload = false
            self?.loading = false
            self?.showLottie = false
        }
    }
    
    internal func searchProducts() -> Void {
        if !searchText.isEmpty {
            guard !loading else { return }
            DispatchQueue.main.async {
                self.loading = true
                self.showLottie = true
            }
            
            self.currentPage = 1
            self.reload = true
            
            UServiceManager.shared.callService(queryParam: queryParam) { [weak self] (response: ProductResponse?) in
                if let products = response?.plpResults.records, !products.isEmpty {
                    let filterResponse = products.filter { $0.productDisplayName.localizedCaseInsensitiveContains(self?.searchText ?? "") }
                    self?.products.append(contentsOf: filterResponse)
                    self?.reload = filterResponse.count == self?.contentPage ?? 1
                } else {
                    self?.products = []
                    self?.reload = false
                }
                
                self?.loading = false
                self?.showLottie = false
                
            } failure: { [weak self] err in
                self?.reload = false
                self?.loading = false
                self?.showLottie = false
            }
        }
    }
}
