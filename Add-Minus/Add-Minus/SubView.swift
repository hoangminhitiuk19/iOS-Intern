import UIKit
class MyView: UIView {
    
    var currentNumber: UILabel?
    var currentTime: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        

        currentNumber = UILabel(frame: CGRect(x: 0,
                                             y: frame.size.height*4/5,
                                             width: frame.size.width,
                                             height: frame.size.height/5))
        currentNumber!.text = "Fx Studio"
        currentNumber!.backgroundColor = .lightGray
        currentNumber!.textAlignment = .center
        currentNumber!.textColor = .blue
        self.addSubview(currentNumber!)
               

        currentTime = UILabel(frame: CGRect(x: 70,
                                             y: frame.size.height*4/5,
                                             width: frame.size.width,
                                             height: frame.size.height/5))
        currentTime!.text = "Fx Studio"
        currentTime!.backgroundColor = .lightGray
        currentTime!.textAlignment = .center
        currentTime!.textColor = .blue
        self.addSubview(currentTime!)
               

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
