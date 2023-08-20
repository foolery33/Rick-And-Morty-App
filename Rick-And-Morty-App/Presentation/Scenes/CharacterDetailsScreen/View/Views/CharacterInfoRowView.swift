//
//  CharacterInfoRowView.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import SwiftUI

struct CharacterInfoRowView: View {

    // MARK: - Public Properties

    public var infoName: String

    public var infoData: String

    // MARK: - Body

    var body: some View {
        HStack {
            Text(infoName)
                .font(Font(AppFonts.medium16))
                .foregroundColor(AppColors.gray.swiftUIColor)
            Spacer()
            Spacer()
                .frame(width: Constants.textSpacing)
            Text(infoData)
                .font(Font(AppFonts.medium16))
                .foregroundColor(AppColors.white.swiftUIColor)
        }
    }
}

// MARK: - Preview

struct CharacterInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterInfoRowView(
            infoName: "Type", infoData: "Superhuman (Ghost trains summoner)"
        )
        .preferredColorScheme(.dark)
    }
}

// MARK: - Constants

private extension CharacterInfoRowView {
    enum Constants {
        static let textSpacing: CGFloat = 16
    }
}
