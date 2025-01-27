package mdhash;

import java.security.*;

public class mdjavahash {
    private String hashpass="";

    public String getHashPass(String password) throws 
        NoSuchAlgorithmException{

        String plainText = password;
        MessageDigest mdAlgorithm = MessageDigest.getInstance("SHA-256");
        mdAlgorithm.update(plainText.getBytes());

        byte[] digest = mdAlgorithm.digest();
        StringBuffer hexString = new StringBuffer();

        for (int i = 0; i < digest.length; i++) {
            plainText = Integer.toHexString(0xFF & digest[i]);

            if (plainText.length() < 2) {
                plainText = "0" + plainText;
            }

            hexString.append(plainText);
        }
        hashpass = hexString.toString();

        return hashpass;
    }
}