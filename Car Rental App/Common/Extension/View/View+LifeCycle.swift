//
//  View+LifeCycle.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 29/10/2023.
//

import Foundation
import SwiftUI
import CoreGraphics
import Combine
import UIKit

struct ViewLifeCycleListener: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController

    let onWillDisappear: (() -> Void)?
    let onDidAppear: (() -> Void)?
    let onDidLoad:( () -> Void)?
    var onShouldReconnectPMP: (() -> Void)? = nil
    var appDidBecomeActive: (() -> Void)? = nil
    var willEnterBackground: (() -> Void)? = nil

    func makeCoordinator() -> ViewLifeCycleListener.Coordinator {
        Coordinator(
            onWillDisappear: onWillDisappear,
            onViewDidLoad: onDidLoad,
            onDidAppear: onDidAppear,
            onShouldReconnectPMP: onShouldReconnectPMP,
            willEnterBackground: willEnterBackground,
            appDidBecomeActive: appDidBecomeActive
        )
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewLifeCycleListener>) -> UIViewController {
        context.coordinator
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ViewLifeCycleListener>) {
    }

    class Coordinator: UIViewController {
        var appDidBecomeActive: (() -> Void)? = nil
        var onShouldReconnectPMP: (() -> Void)? = nil
        var willEnterBackground: (() -> Void)? = nil
        var onWillDisappear: (() -> Void)? = nil
        var onViewDidLoad: (() -> Void)? = nil
        let onDidAppear: (() -> Void)?
        var isViewDidAppear = false

        init(
            onWillDisappear: (() -> Void)? = nil,
            onViewDidLoad: (() -> Void)? = nil,
            onDidAppear: (() -> Void)? = nil,
            onShouldReconnectPMP: (() -> Void)? = nil,
            willEnterBackground: (() -> Void)? = nil,
            appDidBecomeActive: (() -> Void)? = nil
        ) {
            self.onWillDisappear = onWillDisappear
            self.onViewDidLoad = onViewDidLoad
            self.onDidAppear = onDidAppear
            self.onShouldReconnectPMP = onShouldReconnectPMP
            self.willEnterBackground = willEnterBackground
            self.appDidBecomeActive = appDidBecomeActive
            super.init(nibName: nil, bundle: nil)

        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            isViewDidAppear = false
            onWillDisappear?()
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            onViewDidLoad?()
            NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) { [weak self] _ in
                if self?.isViewDidAppear == true {
                    self?.onShouldReconnectPMP?()
                }
            }

            NotificationCenter.default.addObserver(forName: UIApplication.willResignActiveNotification, object: nil, queue: .main) { [weak self] _ in
                if self?.isViewDidAppear == true {
                    self?.willEnterBackground?()
                }
            }

            NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: .main) { [weak self] _ in
                if self?.isViewDidAppear == true {
                    self?.appDidBecomeActive?()
                }
            }
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            isViewDidAppear = true
            onDidAppear?()
        }
    }
}

struct WillDisappearModifier: ViewModifier {
    let callBack: () -> Void

    func body(content: Content) -> some View {
        content
            .background(
                ViewLifeCycleListener(
                    onWillDisappear: callBack,
                    onDidAppear: nil,
                    onDidLoad: nil
                )
            )
    }
}

struct ViewDidLoadModifier: ViewModifier {
    let callBack: () -> Void

    func body(content: Content) -> some View {
        content
            .background(
                ViewLifeCycleListener(
                    onWillDisappear: nil,
                    onDidAppear: nil,
                    onDidLoad: callBack
                )
            )
    }
}

struct ViewDidLoadNewModifier: ViewModifier {
    @State private var isFirstLoad: Bool = true
    let callBack: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                if isFirstLoad {
                    callBack()
                }
                isFirstLoad = false
            }
    }
}

extension View {
    func onWillDisappear(_ perform: @escaping () -> Void) -> some View {
        self.modifier(WillDisappearModifier(callBack: perform))
    }

    func onViewDidLoad(_ perform: @escaping () -> Void) -> some View {
        self.modifier(ViewDidLoadModifier(callBack: perform))
    }
    
    func onViewDidLoadNew(_ perform: @escaping () -> Void) -> some View {
        self.modifier(ViewDidLoadNewModifier(callBack: perform))
    }
}
