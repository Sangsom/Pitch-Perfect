//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Rinalds Domanovs on 22/05/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    }

    @IBAction func stopRecording(_ sender: UIButton) {
        // move to other screen
    }
}
