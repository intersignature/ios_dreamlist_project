//
//  DreamListViewController.swift
//  DreamList
//
//  Created by Sirichai Binchai on 10/7/2561 BE.
//  Copyright © 2561 Sirichai Binchai. All rights reserved.
//

import UIKit

class DreamListViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var detailTv: UITextView!
    @IBOutlet weak var dreamListImg: UIImageView!

    var imagePicker: UIImagePickerController!
    
    
    @IBAction func selectPhotoClick(_ sender: UIButton) {
        sender.setTitle("", for: .normal)
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        if let pickImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            dreamListImg.image = pickImage
        }
    }

    
    @IBAction func saveClick(_ sender: UIButton) {
        if let strDetail = detailTv.text, let img = dreamListImg.image {
            let imgName = ManageData.instance.saveImageToFile(image: img)
            let dreamList = DreamList(detail: strDetail, imageName: imgName)
            navigationController?.popViewController(animated: true)
            ManageData.instance.addDreamList(dreamList: dreamList)
            dismiss(animated: true, completion: nil)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        // Do any additional setup after loading the view.
        
        self.detailTv.delegate = self
        imagePicker.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
