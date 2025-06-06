import Foundation

// MARK: - ProductResponse
class ProductResponse: Codable {
    let status: Status
    let pageType: String
    let plpResults: PlpResults
    
    init(status: Status, pageType: String, plpResults: PlpResults) {
        self.status = status
        self.pageType = pageType
        self.plpResults = plpResults
    }
}

// MARK: - Status
class Status: Codable {
    let status: String
    let statusCode: Int
    
    init(status: String, statusCode: Int) {
        self.status = status
        self.statusCode = statusCode
    }
}

// MARK: - PlpResults
class PlpResults: Codable {
    let label: String
    let plpState: PlpState
    let sortOptions: [SortOption]
    let refinementGroups: [RefinementGroup]
    let records: [Record]
    let navigation: Navigation
    let customUrlParam: CustomURLParam
    let metaData: CustomURLParam
    
    init(label: String, plpState: PlpState, sortOptions: [SortOption], refinementGroups: [RefinementGroup], records: [Record], navigation: Navigation, customUrlParam: CustomURLParam, metaData: CustomURLParam) {
        self.label = label
        self.plpState = plpState
        self.sortOptions = sortOptions
        self.refinementGroups = refinementGroups
        self.records = records
        self.navigation = navigation
        self.customUrlParam = customUrlParam
        self.metaData = metaData
    }
}

// MARK: - PlpState
class PlpState: Codable {
    let categoryId: String
    let currentSortOption: String
    let currentFilters: String
    let firstRecNum, lastRecNum, recsPerPage, totalNumRecs: Int
    let plpSellerName: String
    
    init(categoryId: String, currentSortOption: String, currentFilters: String, firstRecNum: Int, lastRecNum: Int, recsPerPage: Int, totalNumRecs: Int, plpSellerName: String) {
        self.categoryId = categoryId
        self.currentSortOption = currentSortOption
        self.currentFilters = currentFilters
        self.firstRecNum = firstRecNum
        self.lastRecNum = lastRecNum
        self.recsPerPage = recsPerPage
        self.totalNumRecs = totalNumRecs
        self.plpSellerName = plpSellerName
    }
}

// MARK: - SortOption
class SortOption: Codable {
    let sortBy: String
    let label: String
    
    init(sortBy: String, label: String) {
        self.sortBy = sortBy
        self.label = label
    }
}

// MARK: - RefinementGroup
class RefinementGroup: Codable {
    let name: String
    let refinement: [Refinement]
    let multiSelect: Bool
    let dimensionName: String
    
    init(name: String, refinement: [Refinement], multiSelect: Bool, dimensionName: String) {
        self.name = name
        self.refinement = refinement
        self.multiSelect = multiSelect
        self.dimensionName = dimensionName
    }
}

// MARK: - Refinement
class Refinement: Codable {
    let count: Int
    let label: String
    let refinementId: String
    let selected: Bool
    let type: String
    let searchName: String?
    
    init(count: Int, label: String, refinementId: String, selected: Bool, type: String, searchName: String?) {
        self.count = count
        self.label = label
        self.refinementId = refinementId
        self.selected = selected
        self.type = type
        self.searchName = searchName
    }
}

// MARK: - Record
class Record: Codable {
    let productId: String
    let skuRepositoryId: String
    let productDisplayName: String
    let productType: String
    let productRatingCount: Int
    let productAvgRating: Double
    let promotionalGiftMessage: String
    let listPrice, minimumListPrice, maximumListPrice: Double
    let promoPrice, minimumPromoPrice, maximumPromoPrice: Double
    let isHybrid, isMarketPlace, isImportationProduct: Bool
    let brand: String?  // Ahora opcional
    let seller: String
    let category: String
    let dwPromotionInfo: DWPromotionInfo
    let isExpressFavoriteStore, isExpressNearByStore: Bool
    let smImage, lgImage, xlImage: String
    let groupType: String
    let plpFlags: [JSONAny]?
    let variantsColor: [VariantsColor]?
    
    init(productId: String, skuRepositoryId: String, productDisplayName: String, productType: String, productRatingCount: Int, productAvgRating: Double, promotionalGiftMessage: String, listPrice: Double, minimumListPrice: Double, maximumListPrice: Double, promoPrice: Double, minimumPromoPrice: Double, maximumPromoPrice: Double, isHybrid: Bool, isMarketPlace: Bool, isImportationProduct: Bool, brand: String?, seller: String, category: String, dwPromotionInfo: DWPromotionInfo, isExpressFavoriteStore: Bool, isExpressNearByStore: Bool, smImage: String, lgImage: String, xlImage: String, groupType: String, plpFlags: [JSONAny]?, variantsColor: [VariantsColor]?) {
        self.productId = productId
        self.skuRepositoryId = skuRepositoryId
        self.productDisplayName = productDisplayName
        self.productType = productType
        self.productRatingCount = productRatingCount
        self.productAvgRating = productAvgRating
        self.promotionalGiftMessage = promotionalGiftMessage
        self.listPrice = listPrice
        self.minimumListPrice = minimumListPrice
        self.maximumListPrice = maximumListPrice
        self.promoPrice = promoPrice
        self.minimumPromoPrice = minimumPromoPrice
        self.maximumPromoPrice = maximumPromoPrice
        self.isHybrid = isHybrid
        self.isMarketPlace = isMarketPlace
        self.isImportationProduct = isImportationProduct
        self.brand = brand
        self.seller = seller
        self.category = category
        self.dwPromotionInfo = dwPromotionInfo
        self.isExpressFavoriteStore = isExpressFavoriteStore
        self.isExpressNearByStore = isExpressNearByStore
        self.smImage = smImage
        self.lgImage = lgImage
        self.xlImage = xlImage
        self.groupType = groupType
        self.plpFlags = plpFlags
        self.variantsColor = variantsColor
    }
}

// MARK: - DWPromotionInfo
class DWPromotionInfo: Codable {
    let dwToolTipInfo: String
    let dWPromoDescription: String
    
    init(dwToolTipInfo: String, dWPromoDescription: String) {
        self.dwToolTipInfo = dwToolTipInfo
        self.dWPromoDescription = dWPromoDescription
    }
}

// MARK: - VariantsColor
class VariantsColor: Codable {
    let colorName: String
    let colorHex: String
    let colorImageURL: String
    let colorMainURL: String?
    let skuId: String?
    let galleryImages: String?
    
    init(colorName: String, colorHex: String, colorImageURL: String, colorMainURL: String?, skuId: String?, galleryImages: String?) {
        self.colorName = colorName
        self.colorHex = colorHex
        self.colorImageURL = colorImageURL
        self.colorMainURL = colorMainURL
        self.skuId = skuId
        self.galleryImages = galleryImages
    }
}

// MARK: - Navigation
class Navigation: Codable {
    let ancester, current: [Ancester]
    let childs: [String]
    
    init(ancester: [Ancester], current: [Ancester], childs: [String]) {
        self.ancester = ancester
        self.current = current
        self.childs = childs
    }
}

// MARK: - Ancester
class Ancester: Codable {
    let label: String
    let categoryId: String
    
    init(label: String, categoryId: String) {
        self.label = label
        self.categoryId = categoryId
    }
}

// MARK: - CustomURLParam
class CustomURLParam: Codable {}

// MARK: - JSONAny
struct JSONAny: Codable {
    let value: Any

    init(_ value: Any) { self.value = value }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        if let v = value as? String { try container.encode(v) }
        else if let v = value as? Int { try container.encode(v) }
        else if let v = value as? Double { try container.encode(v) }
        else if let v = value as? Bool { try container.encode(v) }
        else if let v = value as? [Any] { try container.encode(v.map { JSONAny($0) }) }
        else if let v = value as? [String: Any] { try container.encode(v.mapValues { JSONAny($0) }) }
        else { throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: encoder.codingPath, debugDescription: "Unsupported type")) }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let v = try? container.decode(String.self) { value = v }
        else if let v = try? container.decode(Int.self) { value = v }
        else if let v = try? container.decode(Double.self) { value = v }
        else if let v = try? container.decode(Bool.self) { value = v }
        else if let v = try? container.decode([JSONAny].self) { value = v }
        else if let v = try? container.decode([String: JSONAny].self) { value = v }
        else { throw DecodingError.typeMismatch(JSONAny.self, DecodingError.Context(codingPath: container.codingPath, debugDescription: "Unsupported type")) }
    }
}
