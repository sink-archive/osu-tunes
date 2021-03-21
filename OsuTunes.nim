import terminal, strutils, httpclient, zip/zipfiles, streams, csfml, csfml/audio, osproc, math;

# title
terminal.setForegroundColor(ForegroundColor.fgGreen);
echo("osu!tunes: a music player using osu! beatmaps, by Yellowsink.");
echo("Produly written in Nim.");

# ask for map ID
terminal.setForegroundColor(ForegroundColor.fgMagenta);
echo("Please enter a mapset ID");
var mapId = readLine(stdin);
var dlLink = "https://ainu.pw/d/$#" % [ mapId ];

# download map
terminal.setForegroundColor(ForegroundColor.fgGreen);
echo("Downloading map $#... Please wait." % [ mapId ]);
var client = newHttpClient();
var content = client.getContent(dlLink);
echo("Done.");
var setFileName ="$#.osz" % [ mapId ]; 
writeFile(setFileName, content);
echo("Saved to $#" % [ setFileName ]);

# unzip
echo("Extracting Audio... Please wait.");
var zip: ZipArchive;
discard zip.open(setFileName, fmRead);

var mp3Filename = "$#.mp3" % [ mapId ];
var outStream = newStringStream("");
zip.extractFile("audio.mp3", outStream);
writeFile(mp3Filename, outStream.data);
echo("Done.");
echo("Saved to $#" % [ mp3Filename ]);

# convert audio
var wavFilename = "$#.wav" % [ mapId ];
echo("Converting mp3 to wav...");
discard execCmd("ffmpeg -i \"$#\" \"$#\" -y" % [ mp3Filename, wavFilename ]);
echo("Done.");

# play audio
var soundBuffer = newSoundBuffer(wavFilename);
var sound = newSound(soundBuffer);

echo("Press enter to begin audio playback");
discard readLine(stdin);
sound.play();
while sound.status == SoundStatus.Playing:
    echo "Playing... ", int(round(sound.playingOffset.asSeconds)), " sec";
    sleep 1000.milliseconds;

sound.destroy();
soundBuffer.destroy();