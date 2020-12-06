//
//  ProfileVC.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 11/10/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

protocol MainNavigationDelegate:class {
    func showAuthState()
}

protocol ProfileProtocol:class{
    var IdUser:String { get set }
    var TableView:UITableView{get}
    func getImage(data:Data)
    func user(userName:String, email:String , age:String)
    func switchToAuthState()
    func showLoader ()
    func hideLoader()
}


class ProfileVC: UITableViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var imageLbl: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var logOutLbl: UILabel!
    
    // properties
    var keyFlag:String = ""
    var idUser:String = ""
    var prfileViewModel:ProfileVMProtocol!
    weak var delegate:MainNavigationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        prfileViewModel.loadAllData()
    
    }
    
    
    // MARK:- Public Methods
    class func create() -> ProfileVC {
        let profileVC: ProfileVC = UIViewController.create(storyboardName: Storyboards.main, identifier: ViewControllers.profileVC)
        
        profileVC.prfileViewModel = ProfileViewModel(view: profileVC)
        
        return profileVC
    }
    
    

    
    let imagePicker = UIImagePickerController()
    
    @IBAction func addImage(_ sender: Any) {
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        guard let data = image.jpegData(compressionQuality: 0.8) else {return}
        
        // func upload image to server
        prfileViewModel.uploadImage(data: data)
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
  
    
    @IBAction func backBtn(_ sender: Any) {
        //let todoListVC = TodoListVC.create()
        //todoListVC.delegate.showMainState()
        //self.navigationController?.popToViewController(todoListVC, animated: true)
        let profileVC = UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
       
        self.navigationController?.popToViewController(profileVC, animated: true)
    }
    
    
    @IBAction func EditProfileBtn(_ sender: UIBarButtonItem) {
        
        self.tableView.isEditing = self.tableView.isEditing
        sender.title = (self.tableView.isEditing ) ? "Done" : "Edit"
        
        
        
    }
    
    func alertAddString(){
        
        let alert = UIAlertController(title: "alert", message: "Please Enter data", preferredStyle:.alert)
        alert.addAction(UIAlertAction( title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: {
            $0.placeholder = "Add Data"
            $0.textAlignment = .left
            
        })
        
    
        alert.addAction(UIAlertAction( title: "ADD", style: .destructive, handler: { (UIAlertAction) in
            
            guard let add = alert.textFields?.first?.text?.trimmed, !add.isEmpty  else {return}
            
            APIManager.UpdateProfileData(key: self.keyFlag, newValue: add.description){ success in
                switch success{
                case .failure(let error) :
                    print(error.localizedDescription)
                    
                case .success(_):
                    
                    self.prfileViewModel.loadAllData()
                    }
                }
                
            }
           )
            )
    self.present(alert, animated: true,completion: nil)
    }
    

    
    @IBAction func logOutBtn(_ sender: Any) {
        
        self.prfileViewModel.logOut()
    }
    
 

    // MARK: - Table view data source
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row == 0{
                keyFlag = "0"
                alertAddString()
            }else if indexPath.row == 1 {
                keyFlag = "1"
                alertAddString()
                
            }else if  indexPath.row == 2{
                keyFlag = "2"
                alertAddString()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var arrItems:[String] = [userNameLbl.text ?? "", emailLbl.text ?? "" , ageLbl.text ?? ""]
        let moveObjec = arrItems[sourceIndexPath.row]
        arrItems.remove(at: sourceIndexPath.row)
        arrItems.insert(moveObjec, at: destinationIndexPath.row)
        
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

 

}
extension ProfileVC:ProfileProtocol{
    func switchToAuthState() {
        
        self.delegate?.showAuthState()
        
    }
    
    
    
    
    
    func user(userName: String, email: String, age: String) {
        
        self.userNameLbl.text = userName
        self.emailLbl.text = email
        self.ageLbl.text = age
        
    }
    
    func getImage(data: Data) {
        self.imageProfile.image = UIImage(data:data)
    }
    
    var IdUser: String {
        get {
            return self.idUser
        }
        set {
            idUser = ""
        }
    }
    var TableView: UITableView {
        return self.tableView
    }
    
    func showLoader() {
        self.view.showLoader()
    }
    
    func hideLoader() {
        self.view.HideLoader()
    }
    
    
    
    
}
