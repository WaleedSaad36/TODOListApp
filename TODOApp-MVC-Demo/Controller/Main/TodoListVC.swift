//
//  ViewController.swift
//  TODOApp-MVC-Demo
//
//  Created by IDEAcademy on 10/27/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit



protocol TodoProtocol :class{
    func showLoader()
    func hideLoader()
    func addProtocolArr(TodoArr:[TaskData])
    var TableViwe:UITableView { get }
}



class TodoListVC: UIViewController {

    @IBOutlet weak var TodoView: TodoView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    var addNote: UITextField?
    var todoArr:[TaskData] = []
    var newValue: String = ""
    var idArr:[String] = []
    
    var todoViewModel: TodoVMProtocol!
    weak var delegate:MainNavigationDelegate?
    
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
        
        TodoView.setUp()
        self.todoViewModel.loadAllData()
        self.navigationBar.hidesBackButton = true
    }
    
    // MARK:- Public Methods
    class func create() -> TodoListVC {
        let todoListVC: TodoListVC = UIViewController.create(storyboardName: Storyboards.main, identifier: ViewControllers.todoListVC)
        
        todoListVC.todoViewModel = TOdoViewModel(view:todoListVC)
        
        return todoListVC
    }
    
    
    func setUpTableView () {
        self.TodoView.tableView.register(UINib.init(nibName: Cells.todoCell, bundle: nil), forCellReuseIdentifier: Cells.todoCell)
        self.TodoView.tableView.dataSource = self
        self.TodoView.tableView.delegate = self

    }
    
    @IBAction func addItemsBtn(_ sender: Any) {
        
       let alertController = UIAlertController(title: "Enter note Here", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textFields) in
            textFields.placeholder = "Please Enter note Here"
            
        }
        
        let okAction = UIAlertAction(title: "ok", style: .default) { (_) in
            
                print("problem 1")
                print("success new Task")
                
                guard let descriptionAdd = alertController.textFields?[0].text else {return}
                
                
                self.todoViewModel.addNewTaskTodo( description: descriptionAdd)
            
            
        }
        
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil )
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
       
        
        self.present(alertController,animated: true)
    }
    
    
    @IBAction func goToProfile(_ sender: Any) {
        
        let profileVC = UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        profileVC.delegate = delegate
        self.navigationController?.pushViewController(profileVC, animated: true)
        }
    
    
    }


extension TodoListVC: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       print(todoArr.count)
        return todoArr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.todoCell, for: indexPath) as? TodoCell else {
            return UITableViewCell()
        }
     
        cell.descriptionLbl.text = todoArr[indexPath.row].description
       return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {return}
        todoArr.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        self.TodoView.tableView.reloadData()
    }
    
    
    
}
extension TodoListVC:TodoProtocol{
    
    var TableViwe: UITableView {
        return self.TodoView.tableView
    }
    
    func addProtocolArr(TodoArr: [TaskData]) {
        self.todoArr = TodoArr
    }
    
    func showLoader(){
        self.view.showLoader()
    }
    
    func hideLoader(){
        self.view.HideLoader()
    }
    
    
}
