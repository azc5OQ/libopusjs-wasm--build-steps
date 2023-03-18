https://github.com/azc5OQ/lemon-chat client.html uses libopusjs webassembly. <br>This webassembly is embedded in client.html as base64 string, to get rid of need of loading it externally using http.
<br>
This project can reproduce exact base64 string of that webassembly.
<br>
This project can only be build on linux system with emscripten installed, but afterwards the resulting webassembly file can be used in almost all browsers.
<br>
This project already contains all needed dependencies in .zip file in this repository and all that needs to be done is typing "make".

with correct build tools installed, the build should "just work". If it does not work, make file will complain that some builds are missing and after they are installed it will work.
<br>
After the build of the .wasm file is done, the base64 string, that represebts the contents of that .wasm file, can be produced for example by this python script. By reading its bytes and converting them to base64 string.

<br>
import base64
<br>
file = open('/home/user/Desktop/libopusjs/dist/libopus.wasm', 'rb')
<br>
file_content = file.read()

<br>
result = base64.b64encode(file_content).decode('ascii')
<br>
print(repr(result)

this base64 string can be compared with the string in https://github.com/azc5OQ/lemon-chat, to see if its the same (maybe it wont be, if different emscripten version is used), or this new base64string can replace the old one in https://github.com/azc5OQ/lemon-chat client.html.
