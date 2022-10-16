# Huff immutable

Template for using immutable variables in Huff. The idea is to append the data at the end of the runtime bytecode. It can then be read with `COPYCODE` rather than from storage, saving a ton of gas.
Inspired by [this answer](https://ethereum.stackexchange.com/a/132947) on Ethereum Stack Exchange and [huff-clones](https://github.com/pentagonxyz/huffmate/tree/main/src/mechanisms/huff-clones) from Huffmate.

TODO:
- [x] First version "handmade"
- [ ] Use the constructor


## License

[The Unlicense](https://github.com/huff-language/huff-project-template/blob/master/LICENSE)


## Disclaimer

_These smart contracts are being provided as is. No guarantee, representation or warranty is being made, express or implied, as to the safety or correctness of the user interface or the smart contracts. They have not been audited and as such there can be no assurance they will work as intended, and users may experience delays, failures, errors, omissions, loss of transmitted information or loss of funds. The creators are not liable for any of the foregoing. Users should proceed with caution and use at their own risk._