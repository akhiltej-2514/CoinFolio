//
//  CoinDataService.swift
//  SwiftfulCrypto
//
//  Created by Nick Sarno on 5/9/21.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
    
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        
        let hardCodedCoins: [CoinModel] = [
            CoinModel(
                id: "bitcoin",
                symbol: "btc",
                name: "Bitcoin",
                image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                currentPrice: 60928,
                marketCap: 1200724287112,
                marketCapRank: 1,
                fullyDilutedValuation: 1278770189305,
                totalVolume: 18636356919,
                high24H: 61149,
                low24H: 60041,
                priceChange24H: -49.0335465816461,
                priceChangePercentage24H: -0.08041,
                marketCapChange24H: -3985856853.72363,
                marketCapChangePercentage24H: -0.33086,
                circulatingSupply: 19718328,
                totalSupply: 21000000,
                maxSupply: 21000000,
                ath: 73738,
                athChangePercentage: -17.36561,
                athDate: "2024-03-14T07:10:36.635Z",
                atl: 67.81,
                atlChangePercentage: 89759.59375,
                atlDate: "2013-07-06T00:00:00.000Z",
                lastUpdated: "2024-06-29T14:34:49.656Z",
                sparklineIn7D: SparklineIn7D(price: [64224.34, 64267.70, 64243.03, 64256.05, 64301.33]),
                priceChangePercentage24HInCurrency: -0.0804137141982568,
                currentHoldings: nil
            ), CoinModel(
                id: "bitcoin",
                symbol: "btc",
                name: "Bitcoin",
                image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                currentPrice: 60928,
                marketCap: 1200724287112,
                marketCapRank: 1,
                fullyDilutedValuation: 1278770189305,
                totalVolume: 18636356919,
                high24H: 61149,
                low24H: 60041,
                priceChange24H: -49.0335465816461,
                priceChangePercentage24H: -0.08041,
                marketCapChange24H: -3985856853.72363,
                marketCapChangePercentage24H: -0.33086,
                circulatingSupply: 19718328,
                totalSupply: 21000000,
                maxSupply: 21000000,
                ath: 73738,
                athChangePercentage: -17.36561,
                athDate: "2024-03-14T07:10:36.635Z",
                atl: 67.81,
                atlChangePercentage: 89759.59375,
                atlDate: "2013-07-06T00:00:00.000Z",
                lastUpdated: "2024-06-29T14:34:49.656Z",
                sparklineIn7D: SparklineIn7D(price: [64224.34, 64267.70, 64243.03, 64256.05, 64301.33]),
                priceChangePercentage24HInCurrency: -0.0804137141982568,
                currentHoldings: nil
            ), CoinModel(
                id: "bitcoin",
                symbol: "btc",
                name: "Bitcoin",
                image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                currentPrice: 60928,
                marketCap: 1200724287112,
                marketCapRank: 1,
                fullyDilutedValuation: 1278770189305,
                totalVolume: 18636356919,
                high24H: 61149,
                low24H: 60041,
                priceChange24H: -49.0335465816461,
                priceChangePercentage24H: -0.08041,
                marketCapChange24H: -3985856853.72363,
                marketCapChangePercentage24H: -0.33086,
                circulatingSupply: 19718328,
                totalSupply: 21000000,
                maxSupply: 21000000,
                ath: 73738,
                athChangePercentage: -17.36561,
                athDate: "2024-03-14T07:10:36.635Z",
                atl: 67.81,
                atlChangePercentage: 89759.59375,
                atlDate: "2013-07-06T00:00:00.000Z",
                lastUpdated: "2024-06-29T14:34:49.656Z",
                sparklineIn7D: SparklineIn7D(price: [64224.34, 64267.70, 64243.03, 64256.05, 64301.33]),
                priceChangePercentage24HInCurrency: -0.0804137141982568,
                currentHoldings: nil
            ), CoinModel(
                id: "bitcoin",
                symbol: "btc",
                name: "Bitcoin",
                image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                currentPrice: 60928,
                marketCap: 1200724287112,
                marketCapRank: 1,
                fullyDilutedValuation: 1278770189305,
                totalVolume: 18636356919,
                high24H: 61149,
                low24H: 60041,
                priceChange24H: -49.0335465816461,
                priceChangePercentage24H: -0.08041,
                marketCapChange24H: -3985856853.72363,
                marketCapChangePercentage24H: -0.33086,
                circulatingSupply: 19718328,
                totalSupply: 21000000,
                maxSupply: 21000000,
                ath: 73738,
                athChangePercentage: -17.36561,
                athDate: "2024-03-14T07:10:36.635Z",
                atl: 67.81,
                atlChangePercentage: 89759.59375,
                atlDate: "2013-07-06T00:00:00.000Z",
                lastUpdated: "2024-06-29T14:34:49.656Z",
                sparklineIn7D: SparklineIn7D(price: [64224.34, 64267.70, 64243.03, 64256.05, 64301.33]),
                priceChangePercentage24HInCurrency: -0.0804137141982568,
                currentHoldings: nil
            ), CoinModel(
                id: "bitcoin",
                symbol: "btc",
                name: "Bitcoin",
                image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                currentPrice: 60928,
                marketCap: 1200724287112,
                marketCapRank: 1,
                fullyDilutedValuation: 1278770189305,
                totalVolume: 18636356919,
                high24H: 61149,
                low24H: 60041,
                priceChange24H: -49.0335465816461,
                priceChangePercentage24H: -0.08041,
                marketCapChange24H: -3985856853.72363,
                marketCapChangePercentage24H: -0.33086,
                circulatingSupply: 19718328,
                totalSupply: 21000000,
                maxSupply: 21000000,
                ath: 73738,
                athChangePercentage: -17.36561,
                athDate: "2024-03-14T07:10:36.635Z",
                atl: 67.81,
                atlChangePercentage: 89759.59375,
                atlDate: "2013-07-06T00:00:00.000Z",
                lastUpdated: "2024-06-29T14:34:49.656Z",
                sparklineIn7D: SparklineIn7D(price: [64224.34, 64267.70, 64243.03, 64256.05, 64301.33]),
                priceChangePercentage24HInCurrency: -0.0804137141982568,
                currentHoldings: nil
            ), CoinModel(
                id: "bitcoin",
                symbol: "btc",
                name: "Bitcoin",
                image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                currentPrice: 60928,
                marketCap: 1200724287112,
                marketCapRank: 1,
                fullyDilutedValuation: 1278770189305,
                totalVolume: 18636356919,
                high24H: 61149,
                low24H: 60041,
                priceChange24H: -49.0335465816461,
                priceChangePercentage24H: -0.08041,
                marketCapChange24H: -3985856853.72363,
                marketCapChangePercentage24H: -0.33086,
                circulatingSupply: 19718328,
                totalSupply: 21000000,
                maxSupply: 21000000,
                ath: 73738,
                athChangePercentage: -17.36561,
                athDate: "2024-03-14T07:10:36.635Z",
                atl: 67.81,
                atlChangePercentage: 89759.59375,
                atlDate: "2013-07-06T00:00:00.000Z",
                lastUpdated: "2024-06-29T14:34:49.656Z",
                sparklineIn7D: SparklineIn7D(price: [64224.34, 64267.70, 64243.03, 64256.05, 64301.33]),
                priceChangePercentage24HInCurrency: -0.0804137141982568,
                currentHoldings: nil
            ), CoinModel(
                id: "bitcoin",
                symbol: "btc",
                name: "Bitcoin",
                image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                currentPrice: 60928,
                marketCap: 1200724287112,
                marketCapRank: 1,
                fullyDilutedValuation: 1278770189305,
                totalVolume: 18636356919,
                high24H: 61149,
                low24H: 60041,
                priceChange24H: -49.0335465816461,
                priceChangePercentage24H: -0.08041,
                marketCapChange24H: -3985856853.72363,
                marketCapChangePercentage24H: -0.33086,
                circulatingSupply: 19718328,
                totalSupply: 21000000,
                maxSupply: 21000000,
                ath: 73738,
                athChangePercentage: -17.36561,
                athDate: "2024-03-14T07:10:36.635Z",
                atl: 67.81,
                atlChangePercentage: 89759.59375,
                atlDate: "2013-07-06T00:00:00.000Z",
                lastUpdated: "2024-06-29T14:34:49.656Z",
                sparklineIn7D: SparklineIn7D(price: [64224.34, 64267.70, 64243.03, 64256.05, 64301.33]),
                priceChangePercentage24HInCurrency: -0.0804137141982568,
                currentHoldings: nil
            ), CoinModel(
                id: "bitcoin",
                symbol: "btc",
                name: "Bitcoin",
                image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                currentPrice: 60928,
                marketCap: 1200724287112,
                marketCapRank: 1,
                fullyDilutedValuation: 1278770189305,
                totalVolume: 18636356919,
                high24H: 61149,
                low24H: 60041,
                priceChange24H: -49.0335465816461,
                priceChangePercentage24H: -0.08041,
                marketCapChange24H: -3985856853.72363,
                marketCapChangePercentage24H: -0.33086,
                circulatingSupply: 19718328,
                totalSupply: 21000000,
                maxSupply: 21000000,
                ath: 73738,
                athChangePercentage: -17.36561,
                athDate: "2024-03-14T07:10:36.635Z",
                atl: 67.81,
                atlChangePercentage: 89759.59375,
                atlDate: "2013-07-06T00:00:00.000Z",
                lastUpdated: "2024-06-29T14:34:49.656Z",
                sparklineIn7D: SparklineIn7D(price: [64224.34, 64267.70, 64243.03, 64256.05, 64301.33]),
                priceChangePercentage24HInCurrency: -0.0804137141982568,
                currentHoldings: nil
            ), CoinModel(
                id: "bitcoin",
                symbol: "btc",
                name: "Bitcoin",
                image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                currentPrice: 60928,
                marketCap: 1200724287112,
                marketCapRank: 1,
                fullyDilutedValuation: 1278770189305,
                totalVolume: 18636356919,
                high24H: 61149,
                low24H: 60041,
                priceChange24H: -49.0335465816461,
                priceChangePercentage24H: -0.08041,
                marketCapChange24H: -3985856853.72363,
                marketCapChangePercentage24H: -0.33086,
                circulatingSupply: 19718328,
                totalSupply: 21000000,
                maxSupply: 21000000,
                ath: 73738,
                athChangePercentage: -17.36561,
                athDate: "2024-03-14T07:10:36.635Z",
                atl: 67.81,
                atlChangePercentage: 89759.59375,
                atlDate: "2013-07-06T00:00:00.000Z",
                lastUpdated: "2024-06-29T14:34:49.656Z",
                sparklineIn7D: SparklineIn7D(price: [64224.34, 64267.70, 64243.03, 64256.05, 64301.33]),
                priceChangePercentage24HInCurrency: -0.0804137141982568,
                currentHoldings: nil
            ), CoinModel(
                id: "bitcoin",
                symbol: "btc",
                name: "Bitcoin",
                image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                currentPrice: 60928,
                marketCap: 1200724287112,
                marketCapRank: 1,
                fullyDilutedValuation: 1278770189305,
                totalVolume: 18636356919,
                high24H: 61149,
                low24H: 60041,
                priceChange24H: -49.0335465816461,
                priceChangePercentage24H: -0.08041,
                marketCapChange24H: -3985856853.72363,
                marketCapChangePercentage24H: -0.33086,
                circulatingSupply: 19718328,
                totalSupply: 21000000,
                maxSupply: 21000000,
                ath: 73738,
                athChangePercentage: -17.36561,
                athDate: "2024-03-14T07:10:36.635Z",
                atl: 67.81,
                atlChangePercentage: 89759.59375,
                atlDate: "2013-07-06T00:00:00.000Z",
                lastUpdated: "2024-06-29T14:34:49.656Z",
                sparklineIn7D: SparklineIn7D(price: [64224.34, 64267.70, 64243.03, 64256.05, 64301.33]),
                priceChangePercentage24HInCurrency: -0.0804137141982568,
                currentHoldings: nil
            ), CoinModel(
                id: "bitcoin",
                symbol: "btc",
                name: "Bitcoin",
                image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                currentPrice: 60928,
                marketCap: 1200724287112,
                marketCapRank: 1,
                fullyDilutedValuation: 1278770189305,
                totalVolume: 18636356919,
                high24H: 61149,
                low24H: 60041,
                priceChange24H: -49.0335465816461,
                priceChangePercentage24H: -0.08041,
                marketCapChange24H: -3985856853.72363,
                marketCapChangePercentage24H: -0.33086,
                circulatingSupply: 19718328,
                totalSupply: 21000000,
                maxSupply: 21000000,
                ath: 73738,
                athChangePercentage: -17.36561,
                athDate: "2024-03-14T07:10:36.635Z",
                atl: 67.81,
                atlChangePercentage: 89759.59375,
                atlDate: "2013-07-06T00:00:00.000Z",
                lastUpdated: "2024-06-29T14:34:49.656Z",
                sparklineIn7D: SparklineIn7D(price: [64224.34, 64267.70, 64243.03, 64256.05, 64301.33]),
                priceChangePercentage24HInCurrency: -0.0804137141982568,
                currentHoldings: nil
            ), CoinModel(
                id: "bitcoin",
                symbol: "btc",
                name: "Bitcoin",
                image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                currentPrice: 60928,
                marketCap: 1200724287112,
                marketCapRank: 1,
                fullyDilutedValuation: 1278770189305,
                totalVolume: 18636356919,
                high24H: 61149,
                low24H: 60041,
                priceChange24H: -49.0335465816461,
                priceChangePercentage24H: -0.08041,
                marketCapChange24H: -3985856853.72363,
                marketCapChangePercentage24H: -0.33086,
                circulatingSupply: 19718328,
                totalSupply: 21000000,
                maxSupply: 21000000,
                ath: 73738,
                athChangePercentage: -17.36561,
                athDate: "2024-03-14T07:10:36.635Z",
                atl: 67.81,
                atlChangePercentage: 89759.59375,
                atlDate: "2013-07-06T00:00:00.000Z",
                lastUpdated: "2024-06-29T14:34:49.656Z",
                sparklineIn7D: SparklineIn7D(price: [64224.34, 64267.70, 64243.03, 64256.05, 64301.33]),
                priceChangePercentage24HInCurrency: -0.0804137141982568,
                currentHoldings: nil
            ), CoinModel(
                id: "bitcoin",
                symbol: "btc",
                name: "Bitcoin",
                image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                currentPrice: 60928,
                marketCap: 1200724287112,
                marketCapRank: 1,
                fullyDilutedValuation: 1278770189305,
                totalVolume: 18636356919,
                high24H: 61149,
                low24H: 60041,
                priceChange24H: -49.0335465816461,
                priceChangePercentage24H: -0.08041,
                marketCapChange24H: -3985856853.72363,
                marketCapChangePercentage24H: -0.33086,
                circulatingSupply: 19718328,
                totalSupply: 21000000,
                maxSupply: 21000000,
                ath: 73738,
                athChangePercentage: -17.36561,
                athDate: "2024-03-14T07:10:36.635Z",
                atl: 67.81,
                atlChangePercentage: 89759.59375,
                atlDate: "2013-07-06T00:00:00.000Z",
                lastUpdated: "2024-06-29T14:34:49.656Z",
                sparklineIn7D: SparklineIn7D(price: [64224.34, 64267.70, 64243.03, 64256.05, 64301.33]),
                priceChangePercentage24HInCurrency: -0.0804137141982568,
                currentHoldings: nil
            )]

        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins;
                self?.coinSubscription?.cancel()
            })
    }
    
}
