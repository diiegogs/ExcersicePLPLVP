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

// MARK: - PlpResults
class PlpResults: Codable {
    let label: String
    let plpState: PlpState
    let sortOptions: [SortOption]
    let refinementGroups: [RefinementGroup]
    let records: [Record]
    let navigation: Navigation
    let customURLParam: CustomURLParam
    let metaData: CustomURLParam

    enum CodingKeys: String, CodingKey {
        case label, plpState, sortOptions, refinementGroups, records, navigation
        case customURLParam = "customUrlParam"
        case metaData
    }

    init(label: String, plpState: PlpState, sortOptions: [SortOption], refinementGroups: [RefinementGroup], records: [Record], navigation: Navigation, customURLParam: CustomURLParam, metaData: CustomURLParam) {
        self.label = label
        self.plpState = plpState
        self.sortOptions = sortOptions
        self.refinementGroups = refinementGroups
        self.records = records
        self.navigation = navigation
        self.customURLParam = customURLParam
        self.metaData = metaData
    }
}

// MARK: - CustomURLParam
class CustomURLParam: Codable {
    init() {()}
}

// MARK: - Navigation
class Navigation: Codable {
    let ancester: [Ancester]
    let current: [Ancester]
    let childs: [JSONAny]

    init(ancester: [Ancester], current: [Ancester], childs: [JSONAny]) {
        self.ancester = ancester
        self.current = current
        self.childs = childs
    }
}

// MARK: - Ancester
class Ancester: Codable {
    let label: String
    let categoryID: String

    enum CodingKeys: String, CodingKey {
        case label
        case categoryID = "categoryId"
    }

    init(label: String, categoryID: String) {
        self.label = label
        self.categoryID = categoryID
    }
}

// MARK: - PlpState
class PlpState: Codable {
    let categoryID: String
    let currentSortOption: String
    let currentFilters: String
    let firstRecNum: Int
    let lastRecNum: Int
    let recsPerPage: Int
    let totalNumRecs: Int
    let plpSellerName: String

    enum CodingKeys: String, CodingKey {
        case categoryID = "categoryId"
        case currentSortOption, currentFilters, firstRecNum, lastRecNum, recsPerPage, totalNumRecs, plpSellerName
    }

    init(categoryID: String, currentSortOption: String, currentFilters: String, firstRecNum: Int, lastRecNum: Int, recsPerPage: Int, totalNumRecs: Int, plpSellerName: String) {
        self.categoryID = categoryID
        self.currentSortOption = currentSortOption
        self.currentFilters = currentFilters
        self.firstRecNum = firstRecNum
        self.lastRecNum = lastRecNum
        self.recsPerPage = recsPerPage
        self.totalNumRecs = totalNumRecs
        self.plpSellerName = plpSellerName
    }
}

// MARK: - Record
class Record: Codable, Identifiable {
//    let id: UUID = UUID()
    let productID: String
    let skuRepositoryID: String
    let productDisplayName: String
    let productType: ProductType
    let productRatingCount: Int
    let productAvgRating: Double
    let promotionalGiftMessage: PromotionalGiftMessage
    let listPrice: Double
    let minimumListPrice: Int
    let maximumListPrice: Int
    let promoPrice: Double
    let minimumPromoPrice: Double
    let maximumPromoPrice: Double
    let isHybrid: Bool
    let isMarketPlace: Bool
    let isImportationProduct: Bool
    let brand: String?
    let seller, category: String
    let dwPromotionInfo: DWPromotionInfo
    let isExpressFavoriteStore: Bool
    let isExpressNearByStore: Bool
    let smImage: String
    let lgImage: String
    let xlImage: String
    let groupType: GroupType
    let plpFlags: [JSONAny]
    let variantsColor: [VariantsColor]?

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case skuRepositoryID = "skuRepositoryId"
        case productDisplayName, productType, productRatingCount, productAvgRating, promotionalGiftMessage, listPrice, minimumListPrice, maximumListPrice, promoPrice, minimumPromoPrice, maximumPromoPrice, isHybrid, isMarketPlace, isImportationProduct, brand, seller, category, dwPromotionInfo, isExpressFavoriteStore, isExpressNearByStore, smImage, lgImage, xlImage, groupType, plpFlags, variantsColor
    }

    init(productID: String, skuRepositoryID: String, productDisplayName: String, productType: ProductType, productRatingCount: Int, productAvgRating: Double, promotionalGiftMessage: PromotionalGiftMessage, listPrice: Double, minimumListPrice: Int, maximumListPrice: Int, promoPrice: Double, minimumPromoPrice: Double, maximumPromoPrice: Double, isHybrid: Bool, isMarketPlace: Bool, isImportationProduct: Bool, brand: String?, seller: String, category: String, dwPromotionInfo: DWPromotionInfo, isExpressFavoriteStore: Bool, isExpressNearByStore: Bool, smImage: String, lgImage: String, xlImage: String, groupType: GroupType, plpFlags: [JSONAny], variantsColor: [VariantsColor]?) {
        self.productID = productID
        self.skuRepositoryID = skuRepositoryID
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
    let dWPromoDescription: DWPromoDescription

    init(dwToolTipInfo: String, dWPromoDescription: DWPromoDescription) {
        self.dwToolTipInfo = dwToolTipInfo
        self.dWPromoDescription = dWPromoDescription
    }
}

enum DWPromoDescription: String, Codable {
    case empty = ""
    case yORecibeStrong15StrongEnMonedero = "Y/o recibe <strong>15</strong>% en monedero"
    case yORecibeStrong20StrongEnMonedero = "Y/o recibe <strong>20</strong>% en monedero"
}

enum GroupType: String, Codable {
    case notSpecified = "Not Specified"
}

enum ProductType: String, Codable {
    case bigTicket = "Big Ticket"
    case softLine = "Soft Line"
}

enum PromotionalGiftMessage: String, Codable {
    case na = "NA"
}

// MARK: - VariantsColor
class VariantsColor: Codable {
    let colorName: String
    let colorHex: String
    let colorImageURL: String
    let colorMainURL: JSONNull?
    let skuID: JSONNull?
    let galleryImages: JSONNull?

    enum CodingKeys: String, CodingKey {
        case colorName, colorHex, colorImageURL, colorMainURL
        case skuID = "skuId"
        case galleryImages
    }

    init(colorName: String, colorHex: String, colorImageURL: String, colorMainURL: JSONNull?, skuID: JSONNull?, galleryImages: JSONNull?) {
        self.colorName = colorName
        self.colorHex = colorHex
        self.colorImageURL = colorImageURL
        self.colorMainURL = colorMainURL
        self.skuID = skuID
        self.galleryImages = galleryImages
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
    let refinementID: String
    let selected: Bool
    let type: TypeEnum
    let searchName: SearchName?
    let high: String?
    let low: String?
    let colorHex: String?

    enum CodingKeys: String, CodingKey {
        case count, label
        case refinementID = "refinementId"
        case selected, type, searchName, high, low, colorHex
    }

    init(count: Int, label: String, refinementID: String, selected: Bool, type: TypeEnum, searchName: SearchName?, high: String?, low: String?, colorHex: String?) {
        self.count = count
        self.label = label
        self.refinementID = refinementID
        self.selected = selected
        self.type = type
        self.searchName = searchName
        self.high = high
        self.low = low
        self.colorHex = colorHex
    }
}

enum SearchName: String, Codable {
    case categories1 = "categories.1"
}

enum TypeEnum: String, Codable {
    case range = "Range"
    case value = "Value"
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

// MARK: - Status
class Status: Codable {
    let status: String
    let statusCode: Int

    init(status: String, statusCode: Int) {
        self.status = status
        self.statusCode = statusCode
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    public var hashValue: Int {
            return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
            return nil
    }

    required init?(stringValue: String) {
            key = stringValue
    }

    var intValue: Int? {
            return nil
    }

    var stringValue: String {
            return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
            let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
            return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
            let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
            return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
            if let value = try? container.decode(Bool.self) {
                    return value
            }
            if let value = try? container.decode(Int64.self) {
                    return value
            }
            if let value = try? container.decode(Double.self) {
                    return value
            }
            if let value = try? container.decode(String.self) {
                    return value
            }
            if container.decodeNil() {
                    return JSONNull()
            }
            throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
            if let value = try? container.decode(Bool.self) {
                    return value
            }
            if let value = try? container.decode(Int64.self) {
                    return value
            }
            if let value = try? container.decode(Double.self) {
                    return value
            }
            if let value = try? container.decode(String.self) {
                    return value
            }
            if let value = try? container.decodeNil() {
                    if value {
                            return JSONNull()
                    }
            }
            if var container = try? container.nestedUnkeyedContainer() {
                    return try decodeArray(from: &container)
            }
            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
                    return try decodeDictionary(from: &container)
            }
            throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
            if let value = try? container.decode(Bool.self, forKey: key) {
                    return value
            }
            if let value = try? container.decode(Int64.self, forKey: key) {
                    return value
            }
            if let value = try? container.decode(Double.self, forKey: key) {
                    return value
            }
            if let value = try? container.decode(String.self, forKey: key) {
                    return value
            }
            if let value = try? container.decodeNil(forKey: key) {
                    if value {
                            return JSONNull()
                    }
            }
            if var container = try? container.nestedUnkeyedContainer(forKey: key) {
                    return try decodeArray(from: &container)
            }
            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
                    return try decodeDictionary(from: &container)
            }
            throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
            var arr: [Any] = []
            while !container.isAtEnd {
                    let value = try decode(from: &container)
                    arr.append(value)
            }
            return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
            var dict = [String: Any]()
            for key in container.allKeys {
                    let value = try decode(from: &container, forKey: key)
                    dict[key.stringValue] = value
            }
            return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
            for value in array {
                    if let value = value as? Bool {
                            try container.encode(value)
                    } else if let value = value as? Int64 {
                            try container.encode(value)
                    } else if let value = value as? Double {
                            try container.encode(value)
                    } else if let value = value as? String {
                            try container.encode(value)
                    } else if value is JSONNull {
                            try container.encodeNil()
                    } else if let value = value as? [Any] {
                            var container = container.nestedUnkeyedContainer()
                            try encode(to: &container, array: value)
                    } else if let value = value as? [String: Any] {
                            var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                            try encode(to: &container, dictionary: value)
                    } else {
                            throw encodingError(forValue: value, codingPath: container.codingPath)
                    }
            }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
            for (key, value) in dictionary {
                    let key = JSONCodingKey(stringValue: key)!
                    if let value = value as? Bool {
                            try container.encode(value, forKey: key)
                    } else if let value = value as? Int64 {
                            try container.encode(value, forKey: key)
                    } else if let value = value as? Double {
                            try container.encode(value, forKey: key)
                    } else if let value = value as? String {
                            try container.encode(value, forKey: key)
                    } else if value is JSONNull {
                            try container.encodeNil(forKey: key)
                    } else if let value = value as? [Any] {
                            var container = container.nestedUnkeyedContainer(forKey: key)
                            try encode(to: &container, array: value)
                    } else if let value = value as? [String: Any] {
                            var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                            try encode(to: &container, dictionary: value)
                    } else {
                            throw encodingError(forValue: value, codingPath: container.codingPath)
                    }
            }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
            if let value = value as? Bool {
                    try container.encode(value)
            } else if let value = value as? Int64 {
                    try container.encode(value)
            } else if let value = value as? Double {
                    try container.encode(value)
            } else if let value = value as? String {
                    try container.encode(value)
            } else if value is JSONNull {
                    try container.encodeNil()
            } else {
                    throw encodingError(forValue: value, codingPath: container.codingPath)
            }
    }

    public required init(from decoder: Decoder) throws {
            if var arrayContainer = try? decoder.unkeyedContainer() {
                    self.value = try JSONAny.decodeArray(from: &arrayContainer)
            } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
                    self.value = try JSONAny.decodeDictionary(from: &container)
            } else {
                    let container = try decoder.singleValueContainer()
                    self.value = try JSONAny.decode(from: container)
            }
    }

    public func encode(to encoder: Encoder) throws {
            if let arr = self.value as? [Any] {
                    var container = encoder.unkeyedContainer()
                    try JSONAny.encode(to: &container, array: arr)
            } else if let dict = self.value as? [String: Any] {
                    var container = encoder.container(keyedBy: JSONCodingKey.self)
                    try JSONAny.encode(to: &container, dictionary: dict)
            } else {
                    var container = encoder.singleValueContainer()
                    try JSONAny.encode(to: &container, value: self.value)
            }
    }
}
