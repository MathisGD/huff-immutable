# Huff immutable

Template for using immutable-like variables in Huff.

## EOB immutables

The idea is to append the data at the end of the runtime bytecode (EOB stands for *End Of Bytecode*). It can then be read with `COPYCODE` rather than from storage, saving a ton of gas. This has been inspired by [this answer](https://ethereum.stackexchange.com/a/132947) on Ethereum Stack Exchange.

While reading the immutable's value is pretty straightforward, adding its value at the end of the bytecode requires a litle trick. The Huff compiler usually automatically generates the "bootstrap code" (code that returns the main bytecode). It is placed after the constructor code (code in the CONSTRUCTOR macro) and before the main bytecode.

But when the constructor bytecode contains a `RETURN` opcode (0xf3), it considers that the constructor code contains the bootstrap code, and it does not add it. Then, we can customize the bootstrap bytecode in such a way that it returns the runtime bytecode, concatenated with the immutables variables values. See [EOBImmutable](./src/EOBImmutable.huff).

> :warning: If you want to use the constructor arguments for something else than putting some data at the end of the runtime bytecode, you have to trick a little bit the current constructor.

## License

[The Unlicense](https://github.com/huff-language/huff-project-template/blob/master/LICENSE)


## Disclaimer

_These smart contracts are being provided as is. No guarantee, representation or warranty is being made, express or implied, as to the safety or correctness of the user interface or the smart contracts. They have not been audited and as such there can be no assurance they will work as intended, and users may experience delays, failures, errors, omissions, loss of transmitted information or loss of funds. The creators are not liable for any of the foregoing. Users should proceed with caution and use at their own risk._