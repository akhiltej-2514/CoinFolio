
import SwiftUI
//import SplineRuntime

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false // animate right
    @State private var showPortfolioView: Bool = false // new sheet
    @State private var showSettingsView: Bool = false // new sheet
    @State private var selectedCoin: CoinModel? = nil
    @State private var showDetailView: Bool = false
    
    var body: some View {
//        let url = URL(string: "https://build.spline.design/pqIzwKIn0DZUWnIbv8mC/scene.splineswift")!
        ZStack{
                // background layer
                    Color(.systemGroupedBackground)
                
                    .ignoresSafeArea()
                    .sheet(isPresented: $showPortfolioView, content: {
                        PortfolioView()
                            .environmentObject(vm)
                    })
                
                    VStack(spacing: 0){
                        homeHeader
                        HomeStatsView(showPortfolio: $showPortfolio)
                        SearchBarView(searchText: $vm.searchText)
                        columnTitles
                         if !showPortfolio {
                                allCoinsList
                            }
                        if showPortfolio {
                            ZStack(alignment: .top) {
                                if vm.portfolioCoins.isEmpty && vm.searchText.isEmpty {
                                    portfolioEmptyText
                                } else {
                                    portfolioCoinsList
                                }
                            }
                            .transition(.move(edge: .trailing))
                        }
                        
                        Spacer(minLength: 0)
                    }
                .sheet(isPresented: $showSettingsView, content: {
                    SettingsView()
                })
            }
        .background(
            NavigationLink(
                destination: DetailLoadingView(coin: $selectedCoin),
                isActive: $showDetailView,
                label: { EmptyView() })
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}
extension HomeView {
    
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none)
                .onTapGesture {
                    if showPortfolio {
                        showPortfolioView.toggle()
                    } else {
                        showSettingsView.toggle()
                    }
                }
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: showPortfolio ?"chart.bar.xaxis": "chart.line.uptrend.xyaxis")
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                        
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        ScrollView {
            ForEach(vm.allCoins) { coin in
                Section {
                    CoinRowView(coin: coin, showHoldingsColumn: false)
                        .onTapGesture {
                            segue(coin: coin)
                        }
                        .padding()
                        .background(Color.theme.background)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                }
                .padding(.horizontal)
            }
        }
        .background(Color(.systemGroupedBackground))
        .edgesIgnoringSafeArea(.all)
    }
    private var portfolioCoinsList: some View {
        ScrollView {
            ForEach(vm.portfolioCoins) { coin in
                Section {
                    CoinRowView(coin: coin, showHoldingsColumn: true)
                        .onTapGesture {
                            segue(coin: coin)
                        }
                        .padding()
                        .background(Color.theme.background)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                }
                .padding(.horizontal)
            }
        }
        .background(Color(.systemGroupedBackground))
        .edgesIgnoringSafeArea(.all)
    }
    
    private var portfolioEmptyText: some View {
        Text("You haven't added any coins to your portfolio yet. Click the + button to get started! 🧐")
            .font(.callout)
            .foregroundColor(Color.theme.accent)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .padding(50)
    }
    
    private func segue(coin: CoinModel) {
        selectedCoin = coin
        showDetailView.toggle()
    }
    
    private var columnTitles: some View {
        HStack(spacing: 0) {
                HStack(spacing: 14) {
                    Text("Coin")
                    Image(systemName: "chevron.down")
                        .opacity((vm.sortOption == .rank || vm.sortOption == .rankReversed) ? 1.0 : 0.0)
                        .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
                }
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
                }
            }
            Spacer()
            if showPortfolio {
                HStack(spacing: 4) {
                    Text("Holdings")
                    Image(systemName: "chevron.down")
                        .opacity((vm.sortOption == .holdings || vm.sortOption == .holdingsReversed) ? 1.0 : 0.0)
                        .rotationEffect(Angle(degrees: vm.sortOption == .holdings ? 0 : 180))
                }
                .onTapGesture {
                    withAnimation(.default) {
                        vm.sortOption = vm.sortOption == .holdings ? .holdingsReversed : .holdings
                    }
                }
            }
            HStack(spacing: 4) {
                Text("Price")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .price || vm.sortOption == .priceReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0 : 180))
            }
            .frame(width: UIScreen.main.bounds.width / 2.5, alignment: .trailing)
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
                }
            }
            
            Button(action: {
                withAnimation(.linear(duration: 2.0)) {
                    vm.reloadData()
                }
            }, label: {
                Image(systemName: "goforward")
            })
            .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)
        }
        .frame(width: .infinity,height: 25)
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
