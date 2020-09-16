# IOS14 Color

iOS14에서 추가된 UIColorPickerViewController, UIColoeWell 샘플코드

![](UIColorWellSample.gif)

## UIColorPickerViewController 

```Swift

class ViewController: UIViewController, UIColorPickerViewControllerDelegate {

    let colorPickerVC = UIColorPickerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ... 
    }

    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        // Called when selecting a color in UIColorPickerViewController
    }

    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
         // Called when UIColorPickerViewController closed
    }
...
}
```


## UIColorWell 
```Swift
class ViewController: UIViewController {

    let controlWell: UIColorWell = UIColorWell()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        controlWell.addTarget(self, action: #selector(didSelect(color:)), for: .valueChanged)
        self.view.addSubview(controlWell)
        ... 
    }

    @objc func didSelect(color: UIColorWell){
        // Called when selecting a color in UIColorPickerViewController
    }
...
}
```


## Conclusion 
#### UIColorWell
아래와 색상표와 같은 UI를 가진다. 

사용자가 색을 선택할때 변경되고 KVO를 지원하며 'UIControlEventValueChanged'이벤트를 발생시킵니다.

![](IColorWellSample.gif)

```Swift
@available(iOS 14.0, *)
open class UIColorWell : UIControl {

    /// Title for the color picker.
    ///
    /// Should explain what kind of color to pick. Example values are "Stroke Color" or "Fill Color".
    open var title: String?

    
    /// Controls whether alpha is supported or not.
    ///
    /// If set to `NO` users are only able to pick fully opaque colors.
    open var supportsAlpha: Bool

    /// Sets the selected color on the color picker and is updated when the user changes the selection.
    /// Does support KVO and does send `UIControlEventValueChanged`.
    open var selectedColor: UIColor?
}
```


#### UIColorPickerViewController

```Swift
@available(iOS 14.0, *)
open class UIColorPickerViewController : UIViewController {

    
    weak open var delegate: UIColorPickerViewControllerDelegate?

    
    /// Sets the selected color on the color picker and is updated when the user changes the selection.
    /// Does support KVO.
    open var selectedColor: UIColor

    
    /// Controls whether the color picker shows an alpha slider or not.
    ///
    /// If set to `NO` users are only able to pick fully opaque colors.
    open var supportsAlpha: Bool

    
    public init()
}
```

Delegate 패턴으로 선택한 값을 전달 받습니다. 


'supportsAlpha' 함수 호출시 투명도를 업애는 ColorPickerView를 노출하지만

'ColorWell의 title' 함수 호출을 통해 ColorPickerView 타이틀명을 변경할 수 있다. 

