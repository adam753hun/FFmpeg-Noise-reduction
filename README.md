# FFmpeg-Noise-reduction
Noise reduction using by FFmpeg

Method & process:
(not final)

1 • audio compression ->
2 • Loudness Normalizer -16 LUFS

3 • first, reduce background audio noise using "arnndn" (neural network models)
- using (from GregorR / rnnoise-models)

4 • second, Denoise audio samples with FFT

5 • high-pass filter & low-pass filter 120 Hz - 44 kHz
