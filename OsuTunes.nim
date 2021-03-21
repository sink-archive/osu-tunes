import terminal, strutils, httpclient, zip/zipfiles, streams, csfml, csfml/audio, osproc, math

# title
terminal.setForegroundColor(ForegroundColor.fgGreen)
echo("osu!tunes: a music player using osu! beatmaps, by Yellowsink.")

# ask for map ID
terminal.setForegroundColor(ForegroundColor.fgMagenta)
echo("Please enter a mapset ID")
var mapId = stdin.readLine()
var dlLink = "https://beatconnect.io/b/$#" % [ mapId ]

# download map
terminal.setForegroundColor(ForegroundColor.fgDefault)
echo("Downloading map $#... Please wait." % [ mapId ])
var client = newHttpClient()
var content = client.getContent(dlLink)
echo("Done.")
var setFileName ="$#.osz" % [ mapId ] 
writeFile(setFileName, content)
echo("Saved to $#" % [ setFileName ])

# unzip
echo("Extracting Audio... Please wait.")
var zip: ZipArchive
discard zip.open(setFileName, fmRead)

var zippedAudioName = ""

for file in walkFiles(zip):
    if file.endsWith(".mp3"):
        zippedAudioName = file
        break # get first mp3

var mp3Filename = "$#.mp3" % [ mapId ]
var outStream = newStringStream("")
zip.extractFile(zippedAudioName, outStream)
writeFile(mp3Filename, outStream.data)
echo("Done.")
echo("Saved to $#" % [ mp3Filename ])

# convert audio
var wavFilename = "$#.wav" % [ mapId ]
echo("Converting mp3 to wav...")
discard execProcess("ffmpeg -i \"$#\" \"$#\" -y" % [ mp3Filename, wavFilename ])
echo("Done.")

# play audio
var soundBuffer = newSoundBuffer(wavFilename)
var sound = newSound(soundBuffer)

echo("Press enter to begin audio playback")
discard readLine(stdin)
sound.play()
# TODO: Make this actually work
#             ||
#             \/
echo("Playing. Press enter to pause or Ctrl-C to stop.")
while sound.status == SoundStatus.Playing:
    
    sleep 1000.milliseconds

sound.destroy()
soundBuffer.destroy()

#[
    Some example maps:
    Lagtrain: 1313664
    HBFS: 9183 - doesnt use audio.mp3
]#