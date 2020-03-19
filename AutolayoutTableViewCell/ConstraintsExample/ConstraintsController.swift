/*
Copyright (C) 2020 Accessibility Hive. All Rights Reserved.

Abstract:
Dynamic Types através de Auto-layout por set de diferentes Constraints.

A lógica toda está contida no arquivo da célula, aqui apenas se carrega a célula com identifier constraintCell.
 
*/

import UIKit

class ConstraintsController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Torna o tamanho da célula responsivo ao auto-layout
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "constraintCell", for: indexPath) as? ConstraintsCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}
