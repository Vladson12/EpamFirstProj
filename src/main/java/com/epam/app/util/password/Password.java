package com.epam.app.util.password;

import org.mindrot.jbcrypt.BCrypt;
import org.passay.CharacterData;
import org.passay.CharacterRule;
import org.passay.EnglishCharacterData;
import org.passay.PasswordGenerator;

public class Password {
    private static final PasswordGenerator gen = new PasswordGenerator();
    private static final CharacterData alphabeticals = EnglishCharacterData.Alphabetical;
    private static final CharacterData numerics = EnglishCharacterData.Digit;
    private static final CharacterRule AlphabeticalRule = new CharacterRule(alphabeticals);
    private static final CharacterRule NumericRule = new CharacterRule(numerics);

    static {
        AlphabeticalRule.setNumberOfCharacters(3);
        NumericRule.setNumberOfCharacters(3);
    }

    private Password() {
    }

    public static String generate() {
        return gen.generatePassword(6, AlphabeticalRule, NumericRule);
    }

    public static String hash(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    public static boolean matches(String rawPassword, String encodedPassword) {
        return BCrypt.checkpw(rawPassword, encodedPassword);
    }
}
