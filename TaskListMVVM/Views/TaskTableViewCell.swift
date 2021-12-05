//
//  TaskTableViewCell.swift
//  TaskListMVVM
//
//  Created by Дмитрий Старков on 05.12.2021.
//

//
//  TaskListTableViewCell.swift
//  ArchitectureHomework
//
//  Created by Дмитрий Старков on 25.11.2021.
//

import UIKit

protocol TaskListTableViewCellDelegate: AnyObject {
    func didTapCheck()
}

class TaskListTableViewCell: UITableViewCell {
    
    weak var delegate: TaskListTableViewCellDelegate?
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 15)
        label.textColor = .secondaryLabel
        return label
    }()
    
    let deadlineLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemIndigo
        return label
    }()
    
    var checkMark: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.backgroundColor = .lightGray
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(deadlineLabel)
        addSubview(checkMark)
        checkMark.addTarget(self, action: #selector(didTapCheckMark), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapCheckMark() {
        delegate?.didTapCheck()
    }
    
    public func configure(with viewModel: TaskTableVIewCellViewModel )  {
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
        deadlineLabel.text = viewModel.formattedDate(date: viewModel.deadline)
        if viewModel.isCompleted == true {
            checkMark.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        } else if viewModel.isCompleted == false  {
            checkMark.setImage(UIImage(systemName: "exclamationmark.triangle"), for: .normal)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.frame = CGRect(x: contentView.frame.origin.x + 10, y: contentView.frame.origin.y, width:contentView.frame.width - (contentView.frame.height * 2), height: contentView.frame.height/2  )
        descriptionLabel.frame = CGRect(x: contentView.frame.origin.x + 10, y: contentView.frame.origin.y + nameLabel.frame.height, width: contentView.frame.width - (contentView.frame.height * 2), height: contentView.frame.height/2 )
        deadlineLabel.frame = CGRect(x: contentView.frame.origin.x + contentView.frame.width - deadlineLabel.frame.width - checkMark.frame.width, y: contentView.frame.origin.y, width: contentView.frame.height, height: contentView.frame.height)
        checkMark.frame = CGRect(x: contentView.frame.origin.x + contentView.frame.width - contentView.frame.height , y: contentView.frame.origin.y, width: contentView.frame.height, height: contentView.frame.height)
    }

}
