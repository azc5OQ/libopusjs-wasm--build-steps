this project is not mine, obviously. (I didnt create opus)
all rights belong to their respective owners


this project can reproduce exact .wasm file that is embedded in https://github.com/azc5OQ/lemon-chat client.html as base64 string

all dependencies are already in this repository.

this is ment to be build on linux
if you have correct build tools installed, it should "just work".
try to type "make" , install needed build tools if system complains


if you want to convert .wasm to base64, to embed webassembly to html without need of external loading
it can be done like so:

import base64

file = open('/home/user/Desktop/libopusjs/dist/libopus.wasm', 'rb')
file_content = file.read()

result = base64.b64encode(file_content).decode('ascii')
print(repr(result))

