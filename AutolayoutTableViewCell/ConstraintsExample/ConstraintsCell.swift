/*
Copyright (C) 2020 Accessibility Hive. All Rights Reserved.

Abstract:
Célula da Table View do exemplo de Dynamic Types através de Auto-layout por set de diferentes Constraints.

O layout da célula muda quando a variável tipo bool traitCollection.preferredContentSizeCategory.isAccessibilityCategory é setada.
Ou seja, quando o tamanho do texto aumenta a partir do controle de acessibilidade.

*/

import UIKit

class ConstraintsCell: UITableViewCell {

    // MARK: - Outlets

    // É possível realizar um array com todas as Outlets de Constraints criadas no Storyboard
    // ( Outlet Collection )
    @IBOutlet var normalConstriants: [NSLayoutConstraint]!

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    // Crio o Array com as constraints para caso de tamanhos maiores da fonte, quando a acessibilidade estiver habilitada
    var largeTextConstraints: [NSLayoutConstraint] = []

    // MARK: - Cell Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()

    // Populo array largeTextConstraints
        setupConstraints()
    }

    // Updates constraints for the view.
    // Método chamado automaticamente quando o tamanho do texto é alterado.
    override func updateConstraints() {

        // Caso o tamanho de texto pertença a categoria de acessibilidade, ative as constraints do array largeTextConstraints.
        if traitCollection.preferredContentSizeCategory.isAccessibilityCategory{
            NSLayoutConstraint.deactivate(normalConstriants)
            NSLayoutConstraint.activate(largeTextConstraints)
        }else { // Do contrário, ative as constraints iniciais do Storyboard (Outlet)
            NSLayoutConstraint.activate(normalConstriants)
            NSLayoutConstraint.deactivate(largeTextConstraints)
        }

        // Print apenas para exemplificar que a cada alteração no tamanho de texto o método é chamado
        print("updateConstraints")
        // Super deve ser chamado ao final, de acordo com a documentação
        super.updateConstraints()
    }

    // MARK: - Programmatically Writing Constraints

    func setupConstraints() {
           largeTextConstraints = [
            // Date Label ancorada a esquerda (leading) na contentview
            dateLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            // Date Label ancorada em cima (top) na contentview
            dateLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),

            // Name Label ancorada a esquerda (leading) na contentview
            nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            // Name Label ancorada em cima (firstBaselineAnchor) embaixo (lastBaselineAnchor) da dateLabel
            nameLabel.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: dateLabel.lastBaselineAnchor, multiplier: 1.0),

            // Time Label ancorada a esquerda (leading) na contentview
            timeLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            // Time Label ancorada em cima (firstBaselineAnchor) embaixo (lastBaselineAnchor) da nameLabel
            timeLabel.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: nameLabel.lastBaselineAnchor, multiplier: 1.0),
            // Time Label ancorada embaixo (bottomAnchor) embaixo (lastBaselineAnchor) da contentView
            // Esta última constraint é o que torna o Layout da célula responsivo a mudança no tamanho.
            timeLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: self.contentView.lastBaselineAnchor, multiplier: 0.25)
           ]
    }
}
