/*
Copyright (C) 2020 Accessibility Hive. All Rights Reserved.

Abstract:
Dynamic Types através de Auto-layout por troca da StackView

A lógica do layout responsivo está no arquivo da célula. Aqui apenas o conteúdo da TableView.

*/

import UIKit

class StackViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var titleLabel: UILabel!
    
    
    var names = ["Anthony",
                 "Arthur",
                 "Antevere",
                 "Bruno",
                 "Ivo",
                 "Pietro"]
    
    var messages = ["Mensagem 1",
                    "Mensagem 2",
                    "Mensagem 3",
                    "Mensagem 4",
                    "Mensagem Longa Mensaopaskdjopasdkaposdkaoskodpgem 5",
                    "Mensagem 6"]

    var images = ["anthony",
                 "arthur",
                 "antevere",
                 "bruno",
                 "ivo",
                 "pietro"]

    // MARK: - View Controller Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        
        titleLabel.adjustsFontForContentSizeCategory = true
        
        titleLabel.font = UIFont.dynamicAppFont(withTextSytle: .largeTitle)
    }
    
    //MARK: Observe changes on trait Collection
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        titleLabel.font = UIFont.dynamicAppFont(withTextSytle: .largeTitle)
        
        
    }
}



    // MARK: - Table view data source

extension StackViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "messegeCell", for: indexPath) as! StackViewCell
        
        cell.nameLabel.text = names[indexPath.row]
        cell.messegeLabel.text = messages[indexPath.row]
        cell.userImage.image = UIImage(named: images[indexPath.row])
                
        return cell
    }
    
    
}

