import UIKit

final class TabItemView: UIView {
  
  private(set) var titleLabel: UILabel = UILabel()
  
  public var textColor: UIColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0)
  public var selectedTextColor: UIColor = .white
  public var container: UIView = UIView()
  
  public var isSelected: Bool = false {
    didSet {
      if isSelected {
        titleLabel.textColor = selectedTextColor
        container.backgroundColor = selectedBackgroundColor
      } else {
        titleLabel.textColor = textColor
        container.backgroundColor = notSelectedBackgroundColor
      }
    }
  }
  
  let selectedBackgroundColor = UIColor(red: 234/255, green: 237/255, blue: 18/255, alpha: 1.0)
  let notSelectedBackgroundColor = UIColor(red: 75/255, green: 75/255, blue: 75/255, alpha: 1.0)
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupLabel()
    container.backgroundColor = notSelectedBackgroundColor
    container.layer.cornerRadius = 3
    
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
  }
  
  private func setupLabel() {
    titleLabel = UILabel(frame: bounds)
    titleLabel.textAlignment = .center
    titleLabel.numberOfLines = 2
    titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
    titleLabel.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0)
    titleLabel.backgroundColor = UIColor.clear
    addSubview(container)
    container.addSubview(titleLabel)
    layoutLabel()
  }
  
  private func layoutLabel() {
    
    container.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      container.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
      container.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 3),
      container.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -3),
      container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3)
      ])
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
      titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
      titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)
      ])
  }
}
