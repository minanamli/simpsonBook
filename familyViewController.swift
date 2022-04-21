
import UIKit
import SnapKit


class familyViewController: UIViewController {
    
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    var memberImage : UIImageView = {
        let img = UIImageView()
        return img}()
    
    var memberName : UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 5.0)
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl}()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        memberImage.contentMode = UIView.ContentMode.scaleAspectFit
        memberImage.frame.size.width = 200
        memberImage.frame.size.height = 200
        memberImage.center = self.view.center
        
        super.view.addSubview(memberImage)
        
        
        super.view.addSubview(memberName)
        memberName.textColor = .black
        memberName.snp.makeConstraints{ make -> Void in
           make.edges.equalTo(super.view).inset(UIEdgeInsets(top: 500, left: 140, bottom: 200, right: 50))
       }
        
        memberName.text = selectedLandmarkName
        memberImage.image = selectedLandmarkImage
        
//        super.view.addSubview(image)
        
        
    }
    



}
