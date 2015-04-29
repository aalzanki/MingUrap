    import Foundation
    
    class MainScene: CCNode {
        var percentSuccess = 50
        var curGold = 2000.0
        var reductionPerRound = 0.9
        var gameOver = false
        private var offerObjects : CCNode? = nil
        private var counterOfferObjects : CCNode? = nil
        
        func didLoadFromCCB() {
            offerObjects = getChildByName("offerObjects", recursively: false)
            counterOfferObjects = getChildByName("counterOfferObjects", recursively: false)
            showOffer()
        }
        
        private func acceptBid(num : Float) -> Bool {
            println(num)
            if (num > Float(percentSuccess)) {
                return true
            } else {
                return false
            }
        }
        
        func makeOfferTapped() {
            if !gameOver || curGold < 1 {
                if let slider = offerObjects?.getChildByName("slider", recursively: false) as? CCSlider {
                    processBid(slider.sliderValue, isCounter: false)
                }
                attemptCounterOffer()
            }
        }
        
        private func processBid(bid : Float, isCounter : Bool) {
            var text = "Bid Accepted"
            var goldRemainingText = "You earned \(2000 - Int(bid * Float(curGold))) gold."
            if (!isCounter && !acceptBid(bid * 100)) {
                text = "Bid Denied"
                curGold = curGold * reductionPerRound
                goldRemainingText = "Gold remaining: " + String(Int(curGold))
            } else {
                gameOver = true
            }
            
            if let title = getChildByName("title", recursively: false) as? CCLabelTTF {
                title.string = text
            }
            
            if let goldRemaining = getChildByName("goldRemaining", recursively: false) as? CCLabelTTF {
                goldRemaining.string = goldRemainingText
            }
        }
        
        func showOffer() {
            offerObjects?.visible = true
            counterOfferObjects?.visible = false
        }
        
        func showCounterOffer() {
            offerObjects?.visible = false
            counterOfferObjects?.visible = true
        }
        
        func counterOfferValue() -> Int {
            return 60
        }
        
        func attemptCounterOffer() {
            if (!gameOver) {
                if let title = getChildByName("title", recursively: false) as? CCLabelTTF {
                    title.string = "How about " + counterOfferValue().description + "%?"
                }
                showCounterOffer()
            }
        }
        
        func rejectedCounterOffer() {
            if let title = getChildByName("title", recursively: false) as? CCLabelTTF {
                title.string = "Make a bid"
            }
            
            curGold = curGold * reductionPerRound
            if let goldRemaining = getChildByName("goldRemaining", recursively: false) as? CCLabelTTF {
                goldRemaining.string = "Gold remaining: " + String(Int(curGold))
            }
            showOffer()
        }
        
        func acceptedCounterOffer() {
            // THIS VALUE SHOULD BE CHANGED
            processBid(0.6, isCounter: false)
            showOffer()
        }
    }
