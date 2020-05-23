# VitaminedTableViewDiffableDataSource
Vitamined `UITableViewDiffableDataSource` that supports injecting behavior for some of the extra data source methods.

## How to use it?
1. Simply instantiate the `VitaminedTableViewDiffableDataSource` as if it was a `UITableViewDiffableDataSource`
```swift
let dataSource =
     VitaminedTableViewDiffableDataSource<Section, MyModel>(
     tableView: self.tableView)
     { tableView, indexPath, model in
         let cell = tableView.dequeueReusableCell(
             withIdentifier: cellIdentifier,
             for: indexPath
         )

         cell.textLabel?.text = model.title
         return cell
     }
```

2. Set the callback properties that will override the data source methods
```swift
self.dataSource.titleForHeaderInSection = { tableView, section in
    return "Section title"
}

self.dataSource.canEditRowAt = { tableView, indexPath in 
    return true 
}
        
self.dataSource.commit = { tableView, editingStyle, indexPath in
    if editingStyle == .delete {
         // ...
    }
}
```

3. You are all set!
