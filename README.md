# FFmpeg-Noise-reduction
Noise reduction using by FFmpeg

**Method & Process (Not Final):**  

1. **Audio Compression** → **Loudness Normalization** (-16 LUFS)  
2. Apply **background noise reduction** using the `arnndn` filter (neural network models from [GregorR/rnnoise-models](https://github.com/GregorR/rnnoise-models)).  
3. Apply **FFT-based denoising** to the audio samples.  
4. Apply **high-pass filter** (120 Hz) and **low-pass filter** (up to 44 kHz).  

**Instructions:**  
- Copy the uncompressed WAV (PCM) audio file to this location.  
  - Use a **short file path** (avoid spaces, special characters, or accented letters).  
- Run the BAT file.  
