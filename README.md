# naldodj-totvs-include-decompress
<!-- GETTING STARTED -->
## Getting Started

This is an example of how to decompress .ch and .th binary files.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* [phyton](https://www.python.org/)

### Source

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
## Usage

```sh
    ./decompress.py .\includes\sigawin.ch >> sigawin.ch
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
