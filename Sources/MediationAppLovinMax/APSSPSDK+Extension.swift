import Foundation
import APSSPSDK
import AppLovinSDK

extension APSSPAds {
    public func appLovinMaxIsSupportBanner() -> Bool { APSSPMediationCompany.AppLovin_MAX.isSupportBanner }
    public func appLovinMaxIsSupportNative() -> Bool { APSSPMediationCompany.AppLovin_MAX.isSupportNative }
    public func appLovinMaxIsSupportInterstitial() -> Bool { APSSPMediationCompany.AppLovin_MAX.isSupportInterstitial }
    public func appLovinMaxIsSupportInterstitialVideo() -> Bool { APSSPMediationCompany.AppLovin_MAX.isSupportInterstitialVideo }
    public func appLovinMaxIsSupportRewardVideo() -> Bool { APSSPMediationCompany.AppLovin_MAX.isSupportRewardVideo }
}

/// UID2 토큰을 AppLovin 입찰 요청에 싣는다.
///
/// 토큰은 `setUIDIdentifier` 또는 초기화 시점에 한 번 발급받아 계속 쓴다.
/// 로드 직전에 넣는 이유는 MAX 초기화 이후에 토큰이 도착할 수 있어서다.
/// 토큰이 없을 때는 우리가 넣었던 값만 지운다. 매체가 AppLovin SDK 에 직접 넣은 값은 건드리지 않는다.
/// (식별자가 바뀌어 새 토큰을 기다리는 동안 이전 사용자의 토큰이 남지 않게 하기 위함)
enum AppLovinMaxUID2 {
    private static let tokenKey = "uid2_token"

    /// 마지막으로 AppLovin 에 넣은 토큰
    private static var appliedToken: String?

    static func applyToken() {
        let token = APSSPAds.uidToken.flatMap { $0.isEmpty ? nil : $0 }
        guard token != appliedToken else { return }
        ALSdk.shared().settings.setExtraParameterForKey(tokenKey, value: token)
        appliedToken = token
    }
}
