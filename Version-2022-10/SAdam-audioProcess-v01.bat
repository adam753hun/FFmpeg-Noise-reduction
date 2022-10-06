:::	Loudness Normalizer by Adam using ffmpeg
:::	version wav process/convert EBU R128 | -14 LUFS
:::	ffmpeg.exe

@ECHO OFF

mkdir kimenet_

FOR %%f IN (*.wav) DO (
echo Converting: %%f

ffmpeg.exe -i "%%f" -filter_complex "acompressor=threshold=-6dB:ratio=3:1:attack=0.10:release=3.0:knee=1, loudnorm=I=-16:TP=-1.5:LRA=11, arnndn=m=sh.rnnn, asendcmd=0.0 afftdn sn start,asendcmd=0.4 afftdn sn stop,afftdn=nr=20:nf=-40, highpass=f=120, lowpass=f=44000" -ar 44.1k  "kimenet_\%%~nf nr.wav"
)

echo Finished

PAUSE


:: loudnorm
:: -af loudnorm=I=-14:TP=-0.3:LRA=11

:: zajszűrés (Noise reduction)
:: -af arnndn=m=sh.rnnn