:::	Loudness Normalizer by Adam using ffmpeg
:::	version wav process/convert EBU R128 | -14 LUFS
:::	ffmpeg.exe | Update v2 © 2024.02.05.

@ECHO OFF
mkdir kimenet_ 2>NUL

FOR %%f IN (*.wav) DO (
  echo Converting: %%f
  ffmpeg.exe -fflags +genpts -i "%%f" -filter_complex "acompressor=threshold=-12dB:ratio=4.2:1:attack=0.20:release=20.0:knee=1,volume=5dB,loudnorm=I=-16:TP=-1.5:LRA=11,arnndn=m=sh.rnnn,asendcmd='0.0 afftdn sn start',asendcmd='0.4 afftdn sn stop',afftdn=nr=20:nf=-40,highpass=f=120,lowpass=f=44000,agate=threshold=-50dB:attack=50:release=500:ratio=1000:range=0.0001,aresample=async=1" -ar 44.1k "kimenet_\%%~nf nr.wav"
)

echo Finished
PAUSE


:: loudnorm
:: -af loudnorm=I=-14:TP=-0.3:LRA=11

:: zajszűrés (Noise reduction)
:: -af arnndn=m=sh.rnnn

:: out
::asendcmd='0.0 afftdn sn start',asendcmd='0.4 afftdn sn stop'
::ffmpeg.exe -fflags +genpts -i "%%f" -filter_complex "acompressor=threshold=-12dB:ratio=4.2:1:attack=0.20:release=20.0:knee=1,volume=5dB,loudnorm=I=-16:TP=-1.5:LRA=11,arnndn=m=sh.rnnn,asendcmd='0.0 afftdn sn start',asendcmd='0.4 afftdn sn stop',afftdn=nr=20:nf=-40,highpass=f=120,lowpass=f=44000,aresample=async=1" -ar 44.1k "kimenet_\%%~nf nr.wav"



::Zajszűrés ➜ EQ szűrők ➜ Gate ➜ Átalakítás
::gate=threshold=-50dB    ; -50 dB alatt teljes némítás
::attack=50              ; 50 ms alatt záródik (gyors reagálás)
::release=500            ; 500 ms alatt nyílik (lassú visszatérés)
::ratio=1000             ; Extremális arány (gyakorlatilag "mute")
::range=0.0001           ; -80 dB-es zajpad (16 bites PCM-hez ideális)