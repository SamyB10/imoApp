import SwiftUI

public struct Navigation {
    static func navigationToFilter() -> some View {
        let filterInteractor = FilterInteractor()
        //        let context = FilterHomeContext()
        let filterPresenter = FilterPresenter()
        let manager = FilterViewManager(interacor: filterInteractor)
        let filterView = FilterView(manager: manager)

        filterInteractor.inject(presenter: filterPresenter)
        filterPresenter.inject(display: manager)

        return filterView
    }

    static func navigationToDetailPage(with viewModel: DetailPageViewModel) -> some View {
        return DetailPageView(viewModel: viewModel)
    }
}
