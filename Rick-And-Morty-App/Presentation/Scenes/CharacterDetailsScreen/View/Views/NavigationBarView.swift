//
//  NavigationBarView.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 19.08.2023.
//

import SwiftUI

struct NavigationBarView: View {

    // MARK: - Public Properties

    public var action: () -> Void

    // MARK: - Body

    var body: some View {
        HStack {
            Spacer().frame(width: Constants.arrowButtonLeadingSpacing)
            Button(action: {
                action()
            }) {
                Image(
                    uiImage: AppImages.chevronLeft
                )
                .foregroundColor(AppColors.white.swiftUIColor)
            }
            Spacer()
        }
        .frame(height: Constants.navigationBarViewHeight)
    }
}

// MARK: - Preview

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(action: {})
            .preferredColorScheme(.dark)
    }
}

// MARK: - Constants

private extension NavigationBarView {
    enum Constants {
        static let arrowButtonLeadingSpacing: CGFloat = 24
        static let navigationBarViewHeight: CGFloat = 44
    }
}
