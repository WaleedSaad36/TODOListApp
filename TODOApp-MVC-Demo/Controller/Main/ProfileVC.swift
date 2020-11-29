//
//  ProfileVC.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 11/10/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

class ProfileVC: UITableViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageProfile: UIImageView!
    
    
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    
    
    // properties
    var keyFlag:String = ""
    var idUser:String = ""
    var presenter:ProfilePresenter!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
       
        loadAllData()
    
    }
    
    
    // MARK:- Public Methods
    class func create() -> ProfileVC {
        let profileVC: ProfileVC = UIViewController.create(storyboardName: Storyboards.main, identifier: ViewControllers.profileVC)
        
        profileVC.presenter = ProfilePresenter(view: profileVC)
        
        return profileVC
    }
    
    
//    func showLoader(){
//        self.view.showLoader()
//    }
//
//    func hideLoader(){
//        self.view.HideLoader()
//    }
//
    func showLoader (){
        self.view.showLoader()
    }
    
    
    func hideLoader(){
        self.view.HideLoader()
    }
    
     func loadAllData (){
        self.view.showLoader()
        
        APIManager.getLoggin{(response) in
            switch response{
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let result):
                print(result)
                self.userNameLbl.text = result.name
                self.ageLbl.text = String(result.age)
                self.emailLbl.text = result.email
                self.idUser = result.id
                //self.getImageAPI(id:self.idUser)
                self.presenter.getImageAPI(id: result.id)
                self.tableView.reloadData()
            }
            
        }
        self.view.HideLoader()
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
        presenter.uploadImage(data: data)
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func getImage(data:Data){
        self.imageProfile.image = UIImage(data:data)
        
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        let todoListVC = TodoListVC.create()

        self.navigationController?.popToViewController(todoListVC, animated: true)
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
                    
                    self.loadAllData()
                    }
                }
                
            }
           )
            )
    self.present(alert, animated: true,completion: nil)
    }
    

    
    @IBAction func logOutBtn(_ sender: Any) {
        
        self.presenter.logOut()
    }
    func goToSignIn(){
        let signInVc = SignInVC.create()
        let signInNavVC = UINavigationController(rootViewController: signInVc)
        AppDelegate.shared().window?.rootViewController = signInNavVC
    }
    
//     func uploadImage(data: data){
//        APIManager.uploadPhoto(with: data) { (succes)  in
//
//            if succes == true {
//                print("photo Upload succesfuly")
//                self.getImageAPI(id: self.idUser)
//            }else{
//                print("field Upload Photo")
//
//            }
//
//        }
//
//    }
    
    
    
//    func getImageAPI(id:String){
//
//        self.view.showLoader()
//
////        APIManager.getUserPhoto(whit: id){ (_,data,_) in
////
////            if let data = data {
////                self.imageProfile.image = UIImage(data:data)
////            }
////
////                print("get image succes")
//        self.view.HideLoader()
//    }
//    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return User.count
//
//    }

//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
    //Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
 
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
        var arrItems:[String] = [userNameLbl.text ?? "",emailLbl.text ?? "" ,ageLbl.text ?? ""]
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
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
