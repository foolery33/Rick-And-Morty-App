//
//  CharacterOriginView.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 19.08.2023.
//

import SwiftUI

struct CharacterOriginView: View {

    // MARK: - Public Properties

    @Binding public var origin: LocationDomain

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: AppConstants.spacingMedium) {
            Text(R.string.localizable.origin())
                .font(Font(AppFonts.semibold17))
                .foregroundColor(AppColors.white.swiftUIColor)
            HStack(spacing: AppConstants.spacingMedium) {
                Image(uiImage: AppImages.planet)
                    .padding(.all, AppConstants.spacingLarge)
                    .background(
                        AppColors.deepBlue.swiftUIColor.cornerRadius(
                            Constants.planetBackgroundCornerRadius
                        )
                    )
                VStack(alignment: .leading, spacing: AppConstants.spacingSmall) {
                    Text(origin.name.valueOrUnknown)
                        .font(Font(AppFonts.semibold17))
                        .foregroundColor(AppColors.white.swiftUIColor)
                    Text(origin.type.valueOrUnknown)
                        .font(Font(AppFonts.medium13))
                        .foregroundColor(AppColors.brightGreen.swiftUIColor)
                }
                Spacer()
            }
            .padding(.all, AppConstants.spacingSmall)
            .background(
                AppColors.darkCharcoal.swiftUIColor.cornerRadius(
                    Constants.backgroundCornerRadius
                )
            )
        }
    }
}

// MARK: - Preview

struct CharacterOriginView_Previews: PreviewProvider {
    @State private static var origin: LocationDomain = .init(
        id: 0,
        name: "name",
        type: "type",
        dimension: "",
        residents: [],
        url: "",
        created: ""
    )
    static var previews: some View {
        CharacterOriginView(
            origin: $origin
        )
        .preferredColorScheme(.dark)
    }
}

// MARK: - Constants

private extension CharacterOriginView {
    enum Constants {
        static let planetBackgroundCornerRadius: CGFloat = 10
        static let backgroundCornerRadius: CGFloat = 16
    }
}
