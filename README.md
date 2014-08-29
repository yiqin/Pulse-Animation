Pulse-Animation
===============

Pulsing Layout Animation in iOS


![Alt text](/YQPulseAnimation-Example/screenshot_1.png?raw=true "Optional Title")


How to Start
======
Add YQPulsingLayer.swift into your project in Xcode


How to Use
======
In your code:
```Swift
        // declare a pulsing layer
        var pulsingLayer = YQPulsingLayer()
        
        // place the pulsing layer in the center the object view
        pulsingLayer.position = objectView.center
        
        // add the pulsing layer to the view
        view.layer.insertSublayer(pulsingLayer, below: objectView.layer)
```

How to Contribute
======
1. Fork it.
2. Create your feature branch (git checkout -b new-feature).
3. Commit your changes (git commit -am 'Added new-feature').
4. Push to the branch (git push origin new-feature).
5. Create new Pull Request.
