//
//  DetailViewController.swift
//  Day23
//
//  Created by 이태현 on 2022/08/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var selectedName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedName?.replacingOccurrences(of: "@3x.png", with: "")
        
        imageView.image = UIImage(named: selectedName!)
        imageView.layer.borderWidth = 1
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTap))
        // Do any additional setup after loading the view.
    }
    
    @objc func shareTap() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, title!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
