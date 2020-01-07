//
//  FullScreenPlayer.swift
//  Player
//
//  Created by Ramon Vicente on 18/04/18.
//

import Foundation
import AVFoundation
import AVKit

class FullScreenPlayer: AVPlayerViewController {

        // MARK:- Variables
        fileprivate var _supportedInterfaceOrientations: UIInterfaceOrientationMask!

        open weak var playbackDelegate: PlayerPlaybackDelegate?

        // MARK:- Initiation
        required convenience init(playbackDelegate: PlayerPlaybackDelegate?, supportedInterfaceOrientations: UIInterfaceOrientationMask) {
                self.init()

                    self.playbackDelegate = playbackDelegate
                self._supportedInterfaceOrientations = supportedInterfaceOrientations
            }


        // MARK:- Overrides
        override func viewDidAppear(_ animated: Bool) {
                super.viewDidAppear(animated)

                    player?.play()
            }
        override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)

                    playbackDelegate?.playerEnterFullScreen()
            }

        override func viewWillDisappear(_ animated: Bool) {
                super.viewWillDisappear(animated)

                    playbackDelegate?.playerExitFullScreen()
            }

        override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
                return _supportedInterfaceOrientations
            }

        override var shouldAutorotate: Bool {
                return true
            }
    }
