//
//  DetailViewController.swift
//  StormViewer
//
//  Created by 이태현 on 2022/08/15.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var picturesCount: Int?
    var currentPictureIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture \(currentPictureIndex!+1) of \(picturesCount!)"
        navigationItem.largeTitleDisplayMode = .never
        // Do any additional setup after loading the view.
        if let selectedImage = selectedImage {
            imageView.image = UIImage(named: selectedImage)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
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
