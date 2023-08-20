//
//  SwiftUILoaderView.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import SwiftUI

struct SwiftUILoaderView: View {

    // MARK: - Body

    var body: some View {
        ZStack {
            AppColors.midnightNavy.swiftUIColor.opacity(Constants.loaderViewBackgroundOpacity)
                .frame(
                    width: Constants.loaderViewBackgroundSize,
                    height: Constants.loaderViewBackgroundSize
                )
                .cornerRadius(Constants.loaderViewBackgroundCornerRadius)
            ProgressView()
                .progressViewStyle(
                    CircularProgressViewStyle(
                        tint: AppColors.white.swiftUIColor
                    )
                )
        }
    }
}

// MARK: - Preview

struct SwiftUILoaderView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUILoaderView()
    }
}

// MARK: - Constants

private extension SwiftUILoaderView {
    enum Constants {
        static let loaderViewBackgroundSize: CGFloat = 55
        static let loaderViewBackgroundCornerRadius: CGFloat = 8
        static let loaderViewBackgroundOpacity: CGFloat = 0.5
    }
}
