import UIKit
import SwipeMenuViewController

final class ViewController: SwipeMenuViewController {
  
  private var datas: [String] = ["BulbasaurBulbasaurBulbasaurBulbasaurBulbasaurBulbasaur","Caterpie", "Golem", "Jynx", "Marshtomp", "Salamence", "Riolu", "Araquanid", "BulbasaurBulbasaurBulbasaurBulbasaurBulbasaurBulbasaur","Caterpie", "Golem", "Jynx", "Marshtomp", "Salamence", "Riolu", "Araquanid", "BulbasaurBulbasaurBulbasaurBulbasaurBulbasaurBulbasaurBulbasaur","Caterpie", "Golem", "Jynx", "Marshtomp", "Salamence", "Riolu", "Araquanid"]
  
  var options = SwipeMenuViewOptions()
  var dataCount: Int = 15
  
  @IBOutlet private weak var settingButton: UIButton!
  
  override func viewDidLoad() {
    
    datas.forEach { data in
      let vc = ContentViewController()
      vc.title = data
      vc.content = data
      self.addChild(vc)
    }
    

    
    super.viewDidLoad()
    
    options.tabView.height = 60
    options.tabView.margin = 12
    options.tabView.backgroundColor = .white
    options.tabView.style = .flexible
    options.tabView.addition = .none
    options.tabView.needsAdjustItemViewWidth = false
    options.tabView.needsConvertTextColorRatio = false
    options.tabView.isSafeAreaEnabled = false
    
    options.tabView.itemView.width = 120
    options.tabView.itemView.margin = 12
    options.tabView.itemView.textColor = .white
    options.tabView.itemView.selectedTextColor = .black
    options.tabView.itemView.clipsToBounds = true
    
    options.tabView.itemView.selectedBackgroundColor = .red
    options.tabView.itemView.unSelectedBackgroundColor = .green
    
    swipeMenuView.reloadData(options: options, default: nil, isOrientationChange: false)
    
    view.bringSubviewToFront(settingButton)
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "popupSegue" {
      let vc = segue.destination as! PopupViewController
      vc.options = options
      vc.dataCount = dataCount
      vc.reloadClosure = { self.reload() }
    }
  }
  
  private func reload() {
    swipeMenuView.reloadData(options: options)
  }
  
  // MARK: - SwipeMenuViewDelegate
  
  override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
    super.swipeMenuView(swipeMenuView, viewWillSetupAt: currentIndex)
    print("will setup SwipeMenuView")
  }
  
  override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) {
    super.swipeMenuView(swipeMenuView, viewDidSetupAt: currentIndex)
    print("did setup SwipeMenuView")
  }
  
  override func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
    super.swipeMenuView(swipeMenuView, willChangeIndexFrom: fromIndex, to: toIndex)
    print("will change from section\(fromIndex + 1)  to section\(toIndex + 1)")
  }
  
  override func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
    super.swipeMenuView(swipeMenuView, didChangeIndexFrom: fromIndex, to: toIndex)
    print("did change from section\(fromIndex + 1)  to section\(toIndex + 1)")
  }
  
  
  // MARK - SwipeMenuViewDataSource
  
  override func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
    return dataCount
  }
  
  override func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
    return children[index].title ?? ""
  }
  
  override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
    let vc = children[index]
    vc.didMove(toParent: self)
    return vc
  }
}
