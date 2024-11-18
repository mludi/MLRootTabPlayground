import Combine
import SwiftUI

extension NSNotification.Name {
    public static let hideTabBar = NSNotification.Name("HideTabBar")
    public static let showTabBar = NSNotification.Name("ShowTabBar")
}

class RootTabbarController: UITabBarController {
    private var tokens = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default
            .publisher(for: .hideTabBar)
            .sink { [weak self] _ in
                self?.tabBar.isHidden = true
            }
            .store(in: &tokens)

        NotificationCenter.default
            .publisher(for: .showTabBar)
            .sink { [weak self] _ in
                self?.tabBar.isHidden = false
            }
            .store(in: &tokens)

        let toolbarViewController = UIHostingController(rootView: ToolbarView())
        toolbarViewController.title = "Toolbar"
        toolbarViewController.tabBarItem.image = UIImage(systemName: "star")

        tabBar.backgroundColor = .lightGray

        self.viewControllers = [
            toolbarViewController
        ]
    }
}
