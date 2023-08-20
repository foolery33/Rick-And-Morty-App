//
//  CharacterInfoView.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 19.08.2023.
//

import SwiftUI

struct CharacterInfoView: View {

    // MARK: - Public Properties

    public var characterInfo: CharacterInfoModel

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: AppConstants.spacingMedium) {
            Text(R.string.localizable.info())
                .font(Font(AppFonts.semibold17))
                .foregroundColor(AppColors.white.swiftUIColor)
            VStack(spacing: AppConstants.spacingMedium) {
                CharacterInfoRowView(
                    infoName: R.string.localizable.species(),
                    infoData: characterInfo.species
                )
                CharacterInfoRowView(
                    infoName: R.string.localizable.type(),
                    infoData: characterInfo.type
                )
                CharacterInfoRowView(
                    infoName: R.string.localizable.gender(),
                    infoData: characterInfo.gender
                )
            }
            .padding(.all, AppConstants.spacingMedium)
            .background(
                AppColors.darkCharcoal.swiftUIColor.cornerRadius(
                    Constants.backgroundCornerRadius
                )
            )
        }
    }
}

// MARK: - Preview

struct CharacterInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterInfoView(
            characterInfo: .init(
                species: "Human",
                type: "None",
                gender: "Male"
            )
        )
    }
}

// MARK: - Constants

private extension CharacterInfoView {
    enum Constants {
        static let backgroundCornerRadius: CGFloat = 16
    }
}
