# naldodj-totvs-include-decompress
<!-- GETTING STARTED -->
## Getting Started

This is an example of how to decompress .ch and .th binary files.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* [phyton](https://www.python.org/)

### Source (Phyton)

  ```sh
    import zlib
    import sys

    with open(sys.argv[1], 'rb') as f:
        content = f.read()

    decompress = zlib.decompressobj(-zlib.MAX_WBITS)
    inflated = decompress.decompress(content[14:])
    inflated += decompress.flush()

    print(inflated[:-1].decode('utf-8', errors='ignore'))
  ```

<!-- USAGE EXAMPLES -->
## Usage (Phyton)

```sh
    ./decompress.py .\includes\sigawin.ch > sigawin.ch
  ```
### Source (pwsh)

  ```sh
        param (
            [string]$filePath
        )

        Add-Type -AssemblyName System.IO.Compression

        $bytes = [System.IO.File]::ReadAllBytes($filePath)
        $compressedContent = $bytes[14..($bytes.Length - 1)]
        $stream = New-Object System.IO.MemoryStream
        $stream.Write($compressedContent, 0, $compressedContent.Length)
        $stream.Position = 0

        $decompressor = New-Object System.IO.Compression.DeflateStream($stream, [System.IO.Compression.CompressionMode]::Decompress)
        $reader = New-Object System.IO.StreamReader($decompressor, [System.Text.Encoding]::UTF8)

        $inflated = $reader.ReadToEnd()
        $reader.Close()

        Write-Output ($inflated.Trim())
  ```

<!-- USAGE EXAMPLES -->
## Usage (pwsh)

```sh
     pwsh .\decompress.ps1 -filePath ".\includes\sigawin.ch" > .\sigawin.ch
  ```

<!-- REFERENCE -->
## Reference
* [imsys](https://github.com/imsys/Protheus-Include)

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[phyton-url]: https://www.python.org/

<p align="right">(<a href="#readme-top">back to top</a>)</p>
