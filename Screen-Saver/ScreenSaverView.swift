import ScreenSaver
import QuartzCore

class ImageSlideshowSaverView: ScreenSaverView {

    private var images: [CGImage] = []
    private var currentIndex = 0
    private let folderName = "images" // image folder
    private var timer: Timer?
    private var imageLayer: CALayer!

    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        setupLayer()
        loadImages()
        setupTimer()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayer()
        loadImages()
        setupTimer()
    }

    override func draw(_ rect: NSRect) {
        super.draw(rect)

        guard !images.isEmpty else { return }
        let image = images[currentIndex]
        imageLayer.contents = image
    }

    private func setupLayer() {
        self.wantsLayer = true
        imageLayer = CALayer()
        imageLayer.frame = self.bounds
        self.layer?.addSublayer(imageLayer)
        
        let transition = CATransition()
        transition.type = .fade
        transition.duration = 0.5
        imageLayer.actions = ["contents": transition]
    }

    private func loadImages() {
        guard let folderURL = Bundle(for: Self.self).url(forResource: folderName, withExtension: nil) else {
            print("Failed to locate folder.")
            return
        }
        
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil)
            for fileURL in fileURLs {
                if let image = NSImage(contentsOf: fileURL), let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil) {
                    images.append(cgImage)
                }
            }
        } catch {
            print("Error loading images: \(error)")
        }
    }

    private func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(nextImage), userInfo: nil, repeats: true)
    }

    @objc private func nextImage() {
        currentIndex += 1
        if currentIndex >= images.count {
            currentIndex = 0
        }
        setNeedsDisplay(bounds)
    }

    deinit {
        timer?.invalidate()
    }
}
