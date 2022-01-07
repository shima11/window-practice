//
//  ViewController.swift
//  window-practice
//
//  Created by Jinsei Shima on 2022/01/06.
//

import UIKit

class ViewController: UIViewController {

  var _window: UIWindow?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

    view.backgroundColor = .green

    print(UIApplication.shared.windows.count)

    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {

      let windowScene = UIApplication.shared
        .connectedScenes
        .filter { $0.activationState == .foregroundActive }
        .first
      if let windowScene = windowScene as? UIWindowScene {
        // TODO: iOS13以降でUIScene使ってる場合はwindowSceneから作らないと表示されない
        self._window = UIWindow(windowScene: windowScene)
      }

//      self._window = UIWindow(frame: UIScreen.main.bounds)

      self._window?.backgroundColor = .green

      let controller = BaseViewController()
//      self._window?.windowLevel = .alert
      self._window?.rootViewController = controller
//      self._window?.isHidden = false
      self._window?.makeKeyAndVisible()

      let detail = DetailViewController()
      controller.present(detail, animated: true, completion: nil)

      self._window?.backgroundColor = .blue

      print(UIApplication.shared.windows.count)
    }


    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//      controller.dismiss(animated: true) {
//        self.window.isHidden = true
//      }
    }
  }


}


class BaseViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red
  }

  deinit {
    print("deinit", type(of: self))
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("will appear", type(of: self))
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("will disappear", type(of: self))
  }
}

class DetailViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .yellow
  }

  deinit {
    print("deinit", type(of: self))
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("will appear", type(of: self))
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("will disappear", type(of: self))
  }
}
