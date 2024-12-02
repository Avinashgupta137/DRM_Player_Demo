//
//  MainVC.swift
//  DRM_Player_Demo
//
//  Created by Appsquadz on 01/12/24.
//

import UIKit
import AVKit
import AVFoundation
import PallyConFPSSDK

class MainVC: UIViewController {

    var playerItem: AVPlayerItem!
    var fpsSDK:PallyConFPSSDK?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do {
            fpsSDK = try PallyConFPSSDK(siteId: "", siteKey: "", fpsLicenseDelegate: self)
        }catch{
            print("Error in pallycon:------",error.localizedDescription)
        }

    }


    @IBAction func playVideoBtnClick(_ sender: UIButton) {

        let videoUrl = "https://d3t6gsg1kpc8bt.cloudfront.net/file_library/videos/vod_drm_ios/4154549/1727529741_8788773993539265/94fad46f-2175-4454-8c17-b2e5a4edfcbe.m3u8"
        guard let videoURL = URL(string: videoUrl) else {
            print("Invalid video URL")
            return
        }

        let urlAsset = AVURLAsset(url: videoURL, options: .none)
        prepareFPS(urlAsset: urlAsset)
        playerItem = AVPlayerItem(asset: urlAsset)

        let player = AVPlayer(playerItem: playerItem)

        let playerViewController = AVPlayerViewController()
        playerViewController.player = player

        present(playerViewController, animated: true) {
            player.play()
        }

    }

    func prepareFPS(urlAsset :  AVURLAsset){
        fpsSDK?.prepare(urlAsset: urlAsset, userId: "", contentId: "4154549_1727529741_1422114387876437", token: "jbO2II/V6NuzaJUwQ3wuK8YuP0XPDP8FVRM+0pAGRvGsRopTL6iou+CmEBoVXiBN6Vxev1oMFiMo2ziyqdvIxERlzR9Tb8kC7idoudm8CDjn59h6LzpxdfwfAdMpOybHTJfa01im+3xab8fmZksPIA9p3IULIJMTjBXV6tSKZcwA5DteNq1lfkErdid01gT0TTfsxX/ttPUtz+s75xE0oE78pmYx87chFKAaTHYqWC9R4wJinOsOfHuiItExrY5k0SkScFNmCc5E7e0nMSuFG1UWnIsKIzWmR0PUb/p2yj9lSJU2lXRL7sf40icpGfi64rbJReIL+yCHrA2eljqol+tqEAMO7h5iAZF9qMyYlsZBbTXR28ZOVWWxwcqnmyJBc1MSxCjI53JarulR+RKFPgIeRBtWPuI2HyX4Mo9/Q9hETREVqJ/IHVNAymcbIIY706ZiO+KxFqM/YsHtCN0Ova2Li/IJfdJ2Cbp7ff1flfa6GoweJQoqQzU90ZijdndbOTfg61FDWyaG72twDbCwejIJYXeHdROIcbsu8HOrN3+TQXavst+0srl/J1Gb9yKels0ePDQcH0Dxit2Zv8hZy2mWtuSgmI4BK2sj29ilU6TtOu5uqtBtYCl7uAscKWcvl2wZ9WBFlCvIbbEy6BVs5rNoxgIBPFGeC7fAT66bJkKG15eCKunflwStn9fX+UawpT5YbC4gEVEE2dzRJaRWUF4Bq04S+P4uJSAw+d90CeED/VquAIvwr9FsBMUscu3D3/t3PPMXi6VokSUD/rxig4qMd8EtMJCPpS8LaWN/H5H959LpCN1B79Qcy+zK5Tz9012lUUexcs+ZPaL3K7WCofhZslWufJxWtTqJnVb1c7jQWsG8gZ7GdpL6Lz+Ra0dvRq8bpNumsHRNFna/pZNAZTjvUZzZtFfhRbu40LIlTgPfo4yLCnFpsfIbzHTPj5AhxP3byuOYgHb32gj1htXpvRoVl/cJTO12U78PJf5oDXvPrfY4RvpJltN4pX0AbXGW5+arSyB5v0kC/MypVZQPMe2jsHt7KZgy/r1lgxjvhPCVR864eOsGSgZhDsmh3TXdYZSvdVfFavoV5Rv0MruuB28Ls4wzBhUee3EflK54vzASqoUtkGlnerkAt4Kp58Y36ww/HrU9fCATgGkztLlWFPejldiSJpBnh7w4pH5DMpAdZkG5MQ9TN+AWnk10j9kWrmSOxMOW4AbVzyTTr0jjGE1vT3EUZ+D4XYeY3UNEK4pt0ORQkHi4ff7z5BV7KXLHnqCABvq1EBe8sUWBUYINWpgNxENPtQQa0+ScfeL+apmu9UxaKBQVRALOSPKy7PXk:MTIzNDU2Nzg5MDEyMzQ1Ng==", licenseUrl: "https://sbapi.wavespb.com/api/V1/onRequestCreateVideoLicense" , appleCertUrl: "https://license-global.pallycon.com/ri/fpsKeyManager.do?siteId=VPFF", liveKeyRotation: false)
    }

}

