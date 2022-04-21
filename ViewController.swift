
import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView = UITableView()
    
    var familyMembers = ["Homer Simpson", "Marge Simpson", "Lisa Simpson", "Maggie Simpson"]
    var familyMembersImages = [UIImage]()
    var chosenMemberName = ""
    var chosenMemberImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.rowHeight = 50
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "my")

        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
                
        tableView.contentInset.top = 20
        tableView.frame = CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight)
        let contentSize = self.tableView.contentSize
        let footer = UIView(frame: CGRect(x: self.tableView.frame.origin.x,
                                          y: self.tableView.frame.origin.y + contentSize.height,
                                          width: self.tableView.frame.size.width,
                                          height: self.tableView.frame.height - self.tableView.contentSize.height))
                
        self.tableView.tableFooterView = footer
        view.addSubview(tableView)
        
        familyMembersImages.append(UIImage(named: "HomerSimpson.png")!)
        familyMembersImages.append(UIImage(named: "MargeSimpson.png")!)
        familyMembersImages.append(UIImage(named: "LisaSimpson.png")!)
        familyMembersImages.append(UIImage(named: "MaggieSimpson.png")!)
        
        navigationItem.title = "Simpson Book"
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "my", for: indexPath)
        cell.textLabel?.text = familyMembers[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return familyMembers.count
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenMemberName = familyMembers[indexPath.row]
        chosenMemberImage = familyMembersImages[indexPath.row]
        
        let nextVC = familyViewController()
        nextVC.selectedLandmarkName = chosenMemberName
        nextVC.selectedLandmarkImage = chosenMemberImage
        navigationController?.pushViewController(nextVC, animated: true)
        
        }
    
}

