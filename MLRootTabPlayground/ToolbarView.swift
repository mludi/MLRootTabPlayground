import SwiftUI

struct ToolbarView: View {
    @State private var isEditing = false {
        didSet {
            if isEditing {
                NotificationCenter.default.post(name: .hideTabBar, object: nil)

            } else {
                NotificationCenter.default.post(name: .showTabBar, object: nil)

            }
        }
    }
    @State private var selectedItems = Set<String>()

    var body: some View {
        NavigationStack {
            Text("Guggerli")
            .navigationTitle("Hey")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if isEditing {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(
                            action: {
                                withAnimation {
                                    isEditing = false
                                }
                                selectedItems = []
                            },
                            label: {
                                Text("Abbrechen")
                                    .bold()
                            }
                        )
                    }

                    ToolbarItem(placement: .bottomBar) {
                        Button(
                            action: {

                            },
                            label: {
                                Text("Als gelesen markieren")
                            }
                        )
                    }

                    ToolbarItem(placement: .bottomBar) {
                        Button(
                            action: {

                            },
                            label: {
                                Text("Löschen")
                            }
                        )
                    }

                }
                else {
                    ToolbarItem(placement: .primaryAction) {
                        menu
                    }
                }
            }
        }
    }

    @ViewBuilder private var menu: some View {
        Button(
            action: {
                withAnimation {
                    isEditing = true
                }
            },
            label: {
                Text("Auswählen")
            }
        )

    }
}

#Preview {
    ToolbarView()
}
