# what is purpose of this repository?

[https://github.com/azc5OQ/lemon-chat/client.html](https://raw.githubusercontent.com/azc5OQ/lemon-chat/master/client/client.html) has two webassembly files embedded in it, for audio functionality. <br> This repository contains steps on how to build one of these two webassembly files, specifically steps on how to build "libopusjs.wasm" file. (second file is called mp3-to-pcm.wasm and also has its own separate repository) <br> Both webassembly files are embedded inside client.html as base64 string, for simplicity, because I want the chat client to be single .html file. <br> <br> Because I want the chat to be open source project, I must provide clear way on how to build it completely, including webassembly files used in the chat client.
<br>
<br>
In short, this github repository aims to provide simple way on how to build the "libopusjs.wasm" file from source.
<br>

# how to build?
Most convenient way to build this is to import virtual machine file (.ova ) to virtual box and run build process there. <br>
The virtual machine already contains everything needed to build this project. (tools, environment variables, source code) <br>
download here -> https://mega.nz/file/VuV23J7D#R-eaT6BZqi5Wkf-gnXR5AZCiWd61sNYTTKlp06ZF8EY <br>
Result of build (libopusjs.wasm file) will appear in /dist directory <br>

<br>
Alternatively, clone this repository and setup build tools manually (emscripten, make, ninja build)


# what to do with result of this build?
resulting .wasm file can be converted to base64 string and can be used to verify that the chat client is using same webassembly file

# does the chat client really need .wasm?
no, if you dont care about audio (speaking, streaming music), edit client.html, do CTRL+F and delete this webassembly files
