protocol MediaPlayer {
    mutating func play()
}

struct PortableAudio: MediaPlayer {
    var isPlaying = false
    mutating func play() {
        isPlaying = true
        print("Now playing ...")
    }
}

