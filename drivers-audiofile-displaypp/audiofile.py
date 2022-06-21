import serial

class AudioFile:
    def __init__(self):
        self.serial = serial.Serial('/dev/ttyACM0')
        self.prod_type()

    def prod_type(self):
        self.send_cmd('ProductType')

    def start_track(self, track):
        self.send_cmd('StartTrack', [track])

    def load_track(self, track, idx=499):
        self.send_cmd('LoadTrack', [idx, track])

    def playlist(self, playlist):
        self.send_cmd('Playlist', [playlist])

    def send_cmd(self, cmd, args=None):
        arg = '=[%s]' % ','.join(map(str, args)) if args else '' 
        c = '$' + cmd + arg +'\r'
        print('sending:', c)
        out = self.serial.write(c.encode())
        #print(self.serial.read(out))
        print('response:', self.serial.readline().decode())

    def toca(self, arq):
        self.load_track(arq, 499)
        self.start_track(499)


a = AudioFile()
a.playlist('BorisPavao.xml')
a.start_track(255)

from time import sleep
def toca_playlist_teste():
    a = AudioFile()
    a.playlist('BorisPavao.xml')

    for t in range(50):
        print('tocando %d' % t)
        a.start_track(t)
        sleep(1/3)

#toca_playlist_teste()
