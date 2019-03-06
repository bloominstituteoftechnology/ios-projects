import UIKit

var labelArray: [UILabel] = []
var labelNumber = 1
var xPlacement: CGFloat = 8
var componentDimension: CGFloat = 40

func setup() {
    while labelArray.count < 5 {
        let labelFrame = CGRect(x: xPlacement, y: CGFloat(0), width: componentDimension, height: componentDimension)
        let label = UILabel(frame: labelFrame)
        label.tag = labelNumber
        label.font = UIFont(name: "bold system font", size: 32)
        label.text = "✯"
        label.textAlignment = .center
//        label.textColor = componentInactiveColor
        labelNumber += 1
        xPlacement += 8
        print(xPlacement)
        labelArray.append(label)
    }
}

setup()
print(labelArray)
