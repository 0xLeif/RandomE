import ArgumentParser
import EKit
import Foundation

struct RandomE: ParsableCommand {
    @Argument(help: "Keyword for the random Emoji")
    var keyword: String
    
    @Option(name: .shortAndLong, help: "Should show keyword")
    var shouldShowKeyword: Bool?
    
    var emoji: String {
       guard let randomElement = E.allCases
                .filter({ "\($0)".contains(keyword) })
                .randomElement() else {
            return E.person_shrugging.rawValue
        }
        
        return randomElement.rawValue
    }
    
    func run() throws {
        guard let shouldShowKeyword = shouldShowKeyword,
              shouldShowKeyword else {
            print(emoji)
            return
        }
        print("\(keyword): \(emoji)")
    }
}

RandomE.main()
