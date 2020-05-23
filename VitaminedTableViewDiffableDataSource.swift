import UIKit

open class VitaminedTableViewDiffableDataSource<SectionIdentifierType, ItemIdentifierType>:
    UITableViewDiffableDataSource<SectionIdentifierType, ItemIdentifierType>
    where SectionIdentifierType : Hashable, ItemIdentifierType : Hashable
{
    /// Callback to override the `tableView(_:titleForHeaderInSection:) -> String?` method from `UITableViewDataSource`.
    open var titleForHeaderInSection: ((_ tableView: UITableView, _ section: Int) -> String?)?
    
    /// Callback to override the `tableView(_:canEditRowAt:) -> Bool` method from `UITableViewDataSource`.
    open var canEditRowAt: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Bool)?
    
    /// Callback to override the `tableView(_:commit:forRowAt:) -> Bool` method from `UITableViewDataSource`.
    open var commit: ((_ tableView: UITableView, _ editingStyle: UITableViewCell.EditingStyle,
                       _ indexPath: IndexPath) -> Void)?

    // MARK: - UITableViewDataSource

    override open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.titleForHeaderInSection?(tableView, section)
    }

    override open func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return self.canEditRowAt?(tableView, indexPath) ?? false
    }

    override open func tableView(
        _ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath)
    {
        self.commit?(tableView, editingStyle, indexPath)
    }
}
