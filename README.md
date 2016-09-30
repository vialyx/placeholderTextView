# placeholderTextView

The simple way to work with attributed placeholder in you UITextView.

1. Use PlaceholderTextView class instead of UITextView;
2. Customize Icon & attributed placeholder

```@IBOutlet weak var tvMessage: PlaceholderTextView!

  let icon: NSTextAttachment = NSTextAttachment()
  icon.image = UIImage(named: "paper-plane")
  let iconString = NSMutableAttributedString(attributedString: NSAttributedString(attachment: icon))
  tvMessage.icon = icon

  let textColor = UIColor.gray
  let lightFont = UIFont(name: "Helvetica-Light", size: tvMessage.font!.pointSize)
  let italicFont = UIFont(name: "Helvetica-LightOblique", size: tvMessage.font!.pointSize)
  let message = NSAttributedString(string: " " + "Personal Message", attributes: [ NSFontAttributeName: lightFont!,   NSForegroundColorAttributeName: textColor])
  iconString.append(message)
  let option = NSAttributedString(string: " " + "Optional", attributes: [ NSFontAttributeName: italicFont!, NSForegroundColorAttributeName: textColor])
  iconString.append(option)
  tvMessage.attributedPlaceHolder = iconString
```

<p align="center">
  <img src="https://github.com/MaksimVialykh/placeholderTextView/blob/master/screenshots/empty.png" width="350"/>
  <img src="https://github.com/MaksimVialykh/placeholderTextView/blob/master/screenshots/with_text.png" width="350"/>
</p>
