import SwiftUI

enum GeistLiterataFont: String {
    // Geist
    case geistRegular = "Geist-Regular"
    case geistLight = "Geist-Light"
    case geistMedium = "Geist-Medium"
    case geistBold = "Geist-Bold"
    case geistExtraBold = "Geist-ExtraBold"
    
    // Literata
    case literataRegular = "Literata-Regular"
    case literataRegularExtraLight = "Literata-Regular_ExtraLight"
    case literataItalic = "Literata-Italic"
    case literataItalicExtraLightItalic = "Literata-Italic_ExtraLight-Italic"
    case literataRegularBold = "Literata-Regular_Bold"
}

extension Text {
     func getGeistLiterataFont(_ font: GeistLiterataFont, size: CGFloat) -> some View {
        self.font(.custom(font.rawValue, size: size))
    }
}
