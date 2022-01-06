//
//  ViewController.swift
//  HologramSeg
//
//  Created by Tan Ren Jie on 4/1/21.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    // MARK: Storyboard connections
    
    @IBOutlet weak var previewView: PreviewView!
    @IBOutlet weak var resumeButton: UIButton!
    @IBOutlet weak var cameraUnavailableLabel: UILabel!
    
    // MARK: Constants
    private let animationDuration = 0.5
    private let delayBetweenInferenceMs: Double = 1000
//    private let collapseTransitionThreshold: CGFloat = -40.0
//    private let expandTransitionThreshold: CGFloat = 40.0
    
    
    // MARK: Instance Variables
    // Holds the results at anytime
//    private var result: Result?
    private var previousInferenceTimeMs: TimeInterval = Date.distantPast.timeIntervalSince1970 * 1000
//    private var initialBottomSpace: CGFloat = 0.0
    
    
    // MARK: Controllers that manage functionality
    // Handles all the camera related functionality
    private lazy var cameraCapture = CameraFeedManager(previewView: previewView)
    
    // Handles all data preprocessing and makes calls to run the inference through the `Interpreter`.
//    private var modelDataHandler: ModelDataHandler? = ModelDataHandler(modelFileInfo: MobileNet.modelInfo, labelsFileInfo: MobileNet.labelsInfo)
    
    // Handles the presenting of results on the screen
//    private var inferenceViewController: InterenceViewController?
    
    
    // MARK: View Handling Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        guard modelDataHandler != nil else{
//            fatalError("Model set up failed")
//        }
        #if targetEnvironment(simulator)
            previewView.shouldUseClipboardImage = true
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(classifyPasteboardImage),
                                                   name: UIApplication.didBecomeActiveNotification,
                                                   object: nil)
        #endif
            cameraCapture.delegate = self

//            addPanGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

//      changeBottomViewState()

        
        #if !targetEnvironment(simulator)
            cameraCapture.checkCameraConfigurationAndStartSession()
        #endif
    }
    
    #if !targetEnvironment(simulator)
      override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        cameraCapture.stopSession()
      }
    #endif
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
      return .lightContent
    }
    
    func presentUnableToResumeSessionAlert() {
        let alert = UIAlertController(
            title: "Unable to resume session",
            message: "There was an error while attempting to resume session",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "OK", style: .default, handler: nil
        ))
    }
//    // MARK: Storyboard Segue Handlers
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//      super.prepare(for: segue, sender: sender)
//
//      if segue.identifier == "EMBED" {
//
//        guard let tempModelDataHandler = modelDataHandler else {
//          return
//        }
//        inferenceViewController = segue.destination as? InferenceViewController
//        inferenceViewController?.wantedInputHeight = tempModelDataHandler.inputHeight
//        inferenceViewController?.wantedInputWidth = tempModelDataHandler.inputWidth
//        inferenceViewController?.maxResults = tempModelDataHandler.resultCount
//        inferenceViewController?.threadCountLimit = tempModelDataHandler.threadCountLimit
//        inferenceViewController?.delegate = self
//
//      }
//    }

    @objc func classifyPasteboardImage() {
        guard let image = UIPasteboard.general.images?.first else {
            return
        }
        
        guard let buffer = CVImageBuffer.buffer(from: image) else {
            return
        }
        
        previewView.image = image
        
        DispatchQueue.global().async {
            self.didOutput(pixelBuffer: buffer)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
        
}


// MARK: CameraFeedManagerDelegate Methods
extension ViewController: CameraFeedManagerDelegate {
    func didOutput(pixelBuffer: CVPixelBuffer) {
        let currentTimeMs = Date().timeIntervalSince1970 * 1000
        guard (currentTimeMs - previousInferenceTimeMs) >= delayBetweenInferenceMs else {return}
        previousInferenceTimeMs = currentTimeMs
        
        // Pass the pixel buffer to Tensorflow Lite to perform inference
//        result = modelDataHandler?.runModel(onFrame: pixelBuffer)
//
//        // Display results by handling off to the InferenceViewController
//        DispatchQueue.main.async {
//            let resolution = CGSize(width: CVPixelBufferGetWidth(pixelBuffer), height: CVPixelBufferGetHeight(pixelBuffer))
//            self.inferenceViewController?.inferenceResult = self.result
//            self.inferenceViewController?.resolution = resolution
//            self.inferenceViewController?.tableView.reloadData()
//        }
    }
    
    // MARK: Session Handling Alerts
    func sessionWasInterrupted(canResumeManually resumeManually: Bool) {
        
        // Updates the UI when session is iterrupted
        if resumeManually {
            self.resumeButton.isHidden = false
        } else {
            self.cameraUnavailableLabel.isHidden = false
        }
    }
    
    func sessionInterruptionEnded() {
        // Updates UI once session interruption has ended
        if !self.cameraUnavailableLabel.isHidden {
            self.cameraUnavailableLabel.isHidden = true
        }
        
        if !self.resumeButton.isHidden {
            self.resumeButton.isHidden = true
        }
    }
    
    
    func sessionRunTimeErrorOccured() {
        // Handles session run time error by updating the UI and providing a button if session can be manually resumed.
        self.resumeButton.isHidden = false
        previewView.shouldUseClipboardImage = true
    }
    
    func presentCameraPermissionsDeniedAlert() {
        let alertController = UIAlertController(title: "Camera Permission Denied",
                                                message: "Camera permissions have been denied for this app. You can change this at Settings",
                                                preferredStyle: .alert)
        
        let cancelAction =  UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) {
            (action) in UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        
        present(alertController, animated: true, completion: nil)
        
        previewView.shouldUseClipboardImage = true
        
    }
    
    func presentVideoConfigurationErrorAlert() {
        let alert = UIAlertController(title: "Camera Configuration Failed", message: "There was an error while configuring camera", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true)
        previewView.shouldUseClipboardImage = true
    }
    
}
