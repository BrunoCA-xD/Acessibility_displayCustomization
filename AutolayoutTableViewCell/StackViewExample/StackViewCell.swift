/*
Copyright (C) 2020 Accessibility Hive. All Rights Reserved.

Abstract:
Célula da Table View do exemplo de Dynamic Types por troca da StackView.

O layout da célula muda ao tornar uma stackView horizontal para uma vertical quando o tamanho do texto aumentar.

*/
import UIKit

class StackViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messegeLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!

    // StackView que engloba tanto a imagem quanto as Labels.
    // Hora ela será horizontal hora vertical, dependendo do tamanho do texto
    @IBOutlet weak var contactStackView: UIStackView!

    // MARK: - Cell Life Cycle

    // Updates constraints for the view.
    // Método chamado automaticamente quando o tamanho do texto é alterado.
    override func updateConstraints() {

        // Verifica se o 'texto maior' está em um tamanho de acessibilidade
        if traitCollection.preferredContentSizeCategory.isAccessibilityCategory {
            contactStackView.axis = .vertical              //stackView Vertical
        } else {
            contactStackView.axis = .horizontal            //stackView Horizontal
        }

        // Print apenas para exemplificar que a cada alteração no tamanho de texto o método é chamado
        print("updateConstraints")
        
        // Super deve ser chamado ao final, de acordo com a documentação
        super.updateConstraints()
    }
}
