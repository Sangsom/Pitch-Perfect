//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Rinalds Domanovs on 22/05/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController {

    var audioRecorder: AVAudioRecorder!

    @IBOutlet var recordingStatusLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var stopButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        stopButton.isHidden = true
    }

    @IBAction func recordButton(_ sender: UIButton) {
        recordingStatusLabel.text = "Tap to finish recording"
        startButton.isHidden = true
        stopButton.isHidden = false

        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))

        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord,
                                 mode: AVAudioSession.Mode.default,
                                 options: AVAudioSession.CategoryOptions.defaultToSpeaker)

        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }

    @IBAction func stopRecording(_ sender: UIButton) {
        recordingStatusLabel.text = "Tap to start recording"
        startButton.isHidden = false
        stopButton.isHidden = true

        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)

        performSegue(withIdentifier: "stopRecording", sender: sender)
    }
}
