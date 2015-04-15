import Foundation

class MainScene: CCNode {
    private func acceptBid(num : Float) -> Bool {
        println(num)
        if (num > 50) {
            return true
        } else {
            return false
        }
    }
    
    func actionTapped() {
        if let slider = getChildByName("slider", recursively: false) as? CCSlider {
            var text = "Bid Accepted"
            if (!acceptBid(slider.sliderValue * 100)) {
                text = "Bid Denied"
            }
            if let title = getChildByName("title", recursively: false) as? CCLabelTTF {
                title.string = text
            }
        }
    }
}
