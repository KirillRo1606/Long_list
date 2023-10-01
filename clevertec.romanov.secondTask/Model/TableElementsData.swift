import UIKit

// MARK: - Table Data

final class TableElementsData {
    private static func getImageNameForElement(_ index: Int) -> String {
        let imageNumber = (index) % 10
        if imageNumber == 0 {
            return "tableImage10"
        }
        return "tableImage\(imageNumber)"
    }
    
    private static func createElementFor(_ index: Int) -> TableElement {
        return TableElement(
            title: "Title \(index)",
            description: "Description \(index)",
            image: UIImage(named: getImageNameForElement(index))
        )
    }
    
    static func getData() -> [TableElement] {
        var tableElements: [TableElement] = []
        for index in 1...1000 {
            tableElements.append(createElementFor(index))
        }
        return tableElements
    }
}
