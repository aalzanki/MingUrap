    import Foundation

class MainScene: CCNode {
    var percentSuccess = 50
    var curGold = 2000.0
    var reductionPerRound = 0.9
    var gameOver = false
    
    private func acceptBid(num : Float) -> Bool {
        println(num)
        if (num > Float(percentSuccess)) {
            return true
        } else {
            return false
        }
    }
    
    func actionTapped() {
        if !gameOver || curGold < 1 {
            if let slider = getChildByName("slider", recursively: false) as? CCSlider {
                var text = "Bid Accepted"
                var goldRemainingText = "You earned \(Int(slider.sliderValue * Float(curGold))) gold."
                if (!acceptBid(slider.sliderValue * 100)) {
                    text = "Bid Denied"
                    curGold = curGold * reductionPerRound
                    goldRemainingText = "Gold remaining: " + String(Int(curGold))
                }
                else {
                    gameOver = true
                }
                if let title = getChildByName("title", recursively: false) as? CCLabelTTF {
                    title.string = text
                }
                if let goldRemaining = getChildByName("goldRemaining", recursively: false) as? CCLabelTTF {
                    goldRemaining.string = goldRemainingText
                }
            }
        }
    }
}
