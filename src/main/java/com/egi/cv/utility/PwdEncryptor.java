/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.egi.cv.utility;
/**
 *
 * @author egi
 */
import java.security.MessageDigest;

/**
 *
 * @author Kancharla Gupta
 */
public class PwdEncryptor {
    public static String encode(byte raw[])
    {
        StringBuffer encoded = new StringBuffer();
        for(int i = 0; i < raw.length; i += 3)
            encoded.append(encodeBlock(raw, i));

        return encoded.toString();
    }

    protected static char[] encodeBlock(byte raw[], int offset)
    {
        int block = 0;
        int slack = raw.length - offset - 1;
        int end = slack < 2 ? slack : 2;
        for(int i = 0; i <= end; i++)
        {
            byte b = raw[offset + i];
            int neuter = b >= 0 ? ((int) (b)) : b + 256;
            block += neuter << 8 * (2 - i);
        }

        char base64[] = new char[4];
        for(int i = 0; i < 4; i++)
        {
            int sixbit = block >>> 6 * (3 - i) & 0x3f;
            base64[i] = getChar(sixbit);
        }

        if(slack < 1)
            base64[2] = '=';
        if(slack < 2)
            base64[3] = '=';
        return base64;
    }

    protected static char getChar(int sixBit)
    {
        if(sixBit >= 0 && sixBit <= 25)
            return (char)(65 + sixBit);
        if(sixBit >= 26 && sixBit <= 51)
            return (char)(97 + (sixBit - 26));
        if(sixBit >= 52 && sixBit <= 61)
            return (char)(48 + (sixBit - 52));
        if(sixBit == 62)
            return '+';
        return sixBit != 63 ? '?' : '/';
    }

    public static byte[] decode(String base64)
    {
        int pad = 0;
        for(int i = base64.length() - 1; base64.charAt(i) == '='; i--)
            pad++;

        int length = (base64.length() * 6) / 8 - pad;
        byte raw[] = new byte[length];
        int rawIndex = 0;
        for(int i = 0; i < base64.length(); i += 4)
        {
            int block = (getValue(base64.charAt(i)) << 18) + (getValue(base64.charAt(i + 1)) << 12) + (getValue(base64.charAt(i + 2)) << 6) + getValue(base64.charAt(i + 3));
            for(int j = 0; j < 3 && rawIndex + j < raw.length; j++)
                raw[rawIndex + j] = (byte)(block >> 8 * (2 - j) & 0xff);

            rawIndex += 3;
        }

        return raw;
    }

    protected static int getValue(char c)
    {
        if(c >= 'A' && c <= 'Z')
            return c - 65;
        if(c >= 'a' && c <= 'z')
            return (c - 97) + 26;
        if(c >= '0' && c <= '9')
            return (c - 48) + 52;
        if(c == '+')
            return 62;
        if(c == '/')
            return 63;
        return c != '=' ? -1 : 0;
    }

    public static String encrypt(String password)
    {
        if(password==null)return null;
        String hash = null;
        try
        {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes("UTF-8"));
            byte raw[] = md.digest();
            hash = encode(raw);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return hash;
    }

}
