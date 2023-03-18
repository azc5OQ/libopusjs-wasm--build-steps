# what is this project?

https://github.com/azc5OQ/lemon-chat client.html uses libopusjs webassembly. <br>This webassembly is embedded in client.html as base64 string, to get rid of need of loading it externally using http.
<br>

This project can reproduce exact base64 string that represents that webassembly.
<br>

# how to build?
This project can only be build on linux system with emscripten and make installed, but afterwards the resulting webassembly file can be used in almost all browsers.
<br>
This project already contains all needed dependencies in .zip file in this repository and all that needs to be done is typing "make".

with correct build tools installed, the build should "just work". If it does not work, make file will complain that some builds are missing and after they are installed it will work.
<br>

After the build of the .wasm file is done, the base64 string, can be produced for example by this python script.
By reading the bytes of the resulting .wasm file

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

# what to do with result of this build?
this base64 string can be compared with the string in https://github.com/azc5OQ/lemon-chat, to see if its the same (maybe it wont be, if different emscripten version is used), or if the new .wasm build is better, to replace the old base64 string with new one
